// 导入页面路由模块
import router from '@ohos.router';
import prompt from '@ohos.promptAction';
import Constants from '../common/constants/Constants';
import LoginRegisterViewModel from '../viewmodel/LoginRegisterViewModel';
import { UserInfo } from '../bean/UserInfoBean';
import * as Utils from "../utils/Utils";
import ResponseResult from '../api/ResponseResult';
/**
 * @desc: 6-登录注册页面
 */

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.gray'))
  .height($r('app.float.45vp'))
  .fontSize($r('app.float.18fp'))
  .backgroundColor($r('app.color.snow'))
  .width(Constants.FULL_PARENT)
  .padding({ left: Constants.INPUT_PADDING_LEFT })
  .margin({ top: $r('app.float.12vp') })
}

@Extend(Line) function lineStyle() {
  .width(Constants.FULL_PARENT)
  .height($r('app.float.1vp'))
  .backgroundColor($r('app.color.gray'))
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.dodger_blue'))
  .fontSize($r('app.float.14fp'))
  .fontWeight(FontWeight.Medium)
}

@Preview
@Entry
@Component
export default struct LoginRegisterPage {
  @State username: string = '';
  @State password: string = '';
  @State repassword: string = '';
  @State isRegister: boolean = false;
  @State isShowProgress: boolean = false;
  private timeOutId: number = -1;

  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height($r('app.float.48vp'))
    .width($r('app.float.48vp'))
    .backgroundColor($r('app.color.snow'))
  }

  loginAndRegister(): void {
    this.isRegister ? this.register() : this.login()
  }

  login() {
    if (this.username === '' || this.password === '') {
      prompt.showToast({ message: $r('app.string.input_empty_tips') })
    } else {
      //处理登录逻辑
      this.isShowProgress = true;
      LoginRegisterViewModel.userLogin(this.username, this.password).then((result: ResponseResult) => {
        //console.log('UserInfo>>>', userInfo)
        console.log('result>>>', result)
        if (!Utils.isEmpty(result.data as UserInfo)) {
          this.delay()
        } else {
          this.isShowProgress = false;
          prompt.showToast({ message: result.errorMsg })
        }
      })
    }
  }

  register() {
    if (this.username === '' || this.password === '' || this.repassword === '') {
      prompt.showToast({ message: $r('app.string.input_empty_tips') })
    } else {
      //处理注册逻辑
      this.isShowProgress = true;
      LoginRegisterViewModel.userRegister(this.username, this.password, this.repassword).then(result => {
        console.log('UserInfo>>>', result)
        if (!Utils.isEmpty(result.data as UserInfo)) {
          this.delay()
        } else {
          this.isShowProgress = false;
          prompt.showToast({ message: result.errorMsg })
        }
      })
    }
  }

  //延迟加载
  delay() {
    if (this.timeOutId === -1) {
      this.timeOutId = setTimeout(() => {
        this.isShowProgress = false;
        this.timeOutId = -1;
        router.replaceUrl({ url: Constants.MainPage_Path });
      }, Constants.LOGIN_DELAY_TIME);
    }
  }

  aboutToDisappear() {
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        Image($r('app.media.ic_arrow_left'))
          .size({ width: $r('app.float.30vp'), height: $r('app.float.30vp') })
          .margin({ right: $r('app.float.10vp'), top: $r('app.float.10vp') })
          .onClick(() => {
            router.back()
          })
      }

      Image($r('app.media.ic_logo'))
        .width($r('app.float.70vp'))
        .height($r('app.float.70vp'))
        .margin({ top: $r('app.float.100vp'), bottom: $r('app.float.8vp') })
      Text(!this.isRegister ? $r('app.string.login_page') : $r('app.string.register_page'))
        .fontSize($r('app.float.24fp'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.black'))
      Text(!this.isRegister ? $r('app.string.login_more') : $r('app.string.register_more'))
        .fontSize($r('app.float.16fp'))
        .fontColor($r('app.color.gray'))
        .margin({ bottom: $r('app.float.30vp'), top: $r('app.float.8vp') })

      TextInput({ placeholder: $r('app.string.account'), text: this.username })
        .maxLength(Constants.INPUT_ACCOUNT_LENGTH)
          //.type(InputType.Normal)
        .inputStyle()
        .onChange((value: string) => {
          this.username = value;
        })
      Line().lineStyle()

      TextInput({ placeholder: $r('app.string.password'), text: this.password })
        .maxLength(Constants.INPUT_PASSWORD_LENGTH)
        .type(InputType.Password)
        .inputStyle()
        .onChange((value: string) => {
          this.password = value;
        })
      Line().lineStyle()


      //注册时-显示确认密码
      if (this.isRegister) {
        TextInput({ placeholder: $r('app.string.repassword'), text: this.repassword })
          .maxLength(Constants.INPUT_PASSWORD_LENGTH)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string) => {
            this.repassword = value;
          })
        Line().lineStyle()
      }

      Button(!this.isRegister ? $r('app.string.login') : $r('app.string.register'), { type: ButtonType.Capsule })
        .width(Constants.BUTTON_WIDTH)
        .height($r('app.float.40vp'))
        .fontSize($r('app.float.16fp'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.dodger_blue'))
        .margin({ top: $r('app.float.87vp'), bottom: $r('app.float.12vp') })
        .onClick(() => {
          this.loginAndRegister();
        })
      Text(!this.isRegister ? $r('app.string.register_account') : $r('app.string.login_account'))
        .fontColor($r('app.color.dodger_blue'))
        .fontSize($r('app.float.16fp'))
        .fontWeight(FontWeight.Medium)
        .onFocus(() => {

        })
        .onClick(() => {
          this.isRegister = !this.isRegister
          this.username = ''
          this.password = ''
          this.repassword = ''
        })

      if (this.isShowProgress) {
        LoadingProgress()
          .color($r('app.color.slate_gray'))
          .width($r('app.float.30vp'))
          .height($r('app.float.30vp'))
          .margin({ top: $r('app.float.20vp') })
      }

    }
    .backgroundColor($r('app.color.snow'))
    .height(Constants.FULL_PARENT)
    .width(Constants.FULL_PARENT)
    .padding({
      left: $r('app.float.12vp'),
      right: $r('app.float.12vp'),
      bottom: $r('app.float.24vp')
    })
  }
}