/**
 * @desc：我的-头部信息
 */
import router from '@ohos.router';
import { UserData, UserInfo } from '../bean/UserInfoBean';
import Constants from '../common/constants/Constants'
import * as Utils from "../utils/Utils";
import MeViewModel from '../viewmodel/MeViewModel';

@Entry
@Component
export default struct MineHead {
  @State userData: UserData = null
  @State isLogin: boolean = false
  @State rank: string = '';
  @State collectIds: string = '';
  @State level: string = '';
  @State coinCount: string = '';

  aboutToAppear() {
    MeViewModel.getUserInfo().then((data: UserData) => {
      this.userData = data;
    }).catch(err => {
      this.userData = null;
    })
  }
  // 在Home页面中
  jumpLoginClick(): void {
    router.pushUrl({
      url: Constants.LoginRegister_Path // 目标url
    }, router.RouterMode.Standard, (err) => {
      if (err) {
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      console.info('Invoke pushUrl succeeded.');
    });
  }

  @Builder
  InfoItem(title: string, content?: string) {
    Column() {
      Text(title)
        .fontSize($r('app.float.18fp'))
        .fontWeight(FontWeight.Bold)
      Text(Utils.isEmpty(content) ? '——' : content)
        .margin({ top: $r('app.float.3vp') })
    }.flexGrow(1)
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Column() {
      //1-设置
      Flex({ alignItems: ItemAlign.Center }) {
        Text('')
          .size({ width: $r('app.float.60vp'), height: $r('app.float.60vp') })

        Text('我的')
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .maxLines(1)
          .fontSize($r('app.float.22fp'))
          .flexGrow(1)

        Image($r('app.media.ic_setting'))
          .size({ width: $r('app.float.30vp'), height: $r('app.float.30vp') })
          .margin({ right: $r('app.float.10vp') })
          .onClick(() => {
            router.pushUrl({ url: Constants.SettingPage_Path })
          })
      }.width(Constants.FULL_PERCENT)
      .backgroundColor($r('app.color.dodger_blue'))

      //2-底部
      Column() {

        //1-头像行-信息
        Flex({ alignItems: ItemAlign.Center }) {
          Image($r('app.media.ic_user'))
            .margin({left: $r('app.float.20vp')})
            .size({ width: $r('app.float.60vp'), height: $r('app.float.60vp') })

          Text(!Utils.isEmpty(this.userData) ? `${this.userData.userInfo.username}` : '欢迎登陆')
            .textAlign(TextAlign.Start)
            .maxLines(1)
            .fontSize($r('app.float.18fp'))
            .margin({ left: $r('app.float.10vp'), right: $r('app.float.10vp') })
            .flexGrow(1)

          Image($r('app.media.ic_arrow_right'))
            .size({ width: $r('app.float.30vp'), height: $r('app.float.30vp') })

        }.width(Constants.FULL_PERCENT)
        .onClick(() => {
          if (Utils.isEmpty(this.userData)) {
            this.jumpLoginClick()
          }
        })
        //2-文章信息
        // Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        //   this.InfoItem('排名',!Utils.isEmpty(this.userData) ? `${this.userData.coinInfo.rank}}` : '——')
        //   this.InfoItem('收藏',!Utils.isEmpty(this.userData) ? `${this.userData.userInfo.collectIds.length.toString()}` : '——')
        //   this.InfoItem('等级',!Utils.isEmpty(this.userData) ? `${this.userData.coinInfo.level.toString()}` : '——')
        //   this.InfoItem('积分',!Utils.isEmpty(this.userData) ? `${this.userData.coinInfo.coinCount.toString()}` : '——')
        // }.margin({ top: $r('app.float.40vp') })

        if (!Utils.isEmpty(this.userData)) {
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            this.InfoItem('排名', this.userData.coinInfo.rank)
            this.InfoItem('收藏', `${this.userData.userInfo.collectIds.length}`)
            this.InfoItem('等级', `${this.userData.coinInfo.level}`)
            this.InfoItem('积分', `${this.userData.coinInfo.coinCount}`)
          }.margin({ top: $r('app.float.40vp') })
        } else {
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            this.InfoItem('排名', '——')
            this.InfoItem('收藏', '——')
            this.InfoItem('等级', '——')
            this.InfoItem('积分', '——')
          }.margin({ top: $r('app.float.40vp') })
        }
      }
      .width(Constants.FULL_PERCENT)
      .padding({
        left: $r('app.float.10vp'),
        right: $r('app.float.10vp'),
        top: $r('app.float.30vp'),
        bottom: $r('app.float.20vp')
      })
    }

  }
}