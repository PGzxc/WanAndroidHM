/**
 * @desc:7-设置页面
 */
import router from '@ohos.router'
import SettingItem from '../bean/SettingItem'
import Constants from '../common/constants/Constants'
import TitleBar from '../view/TitleBar'
import SettingViewModel from '../viewmodel/SettingViewModel'

@Preview
@Entry
@Component
export default struct SettingPage {
  @Builder settingCell(item: SettingItem) {
    Row() {
      Row({ space: 12 }) {
        Image(item.img)
          .width($r('app.float.22vp'))
          .height($r('app.float.22vp'))
        Text(item.title)
          .fontSize($r('app.float.16fp'))
      }

      if (item.others === null) {
        Image($r('app.media.ic_arrow_right'))
          .width($r('app.float.12vp'))
          .height($r('app.float.24vp'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(Constants.FULL_PERCENT)
    .padding({
      left: $r('app.float.8vp'),
      right: $r('app.float.22vp')
    })
  }

  build() {
    Column() {
      //1-头部
      TitleBar({ title: '设置' })
      //2-设置
      List() {
        ForEach(SettingViewModel.getSettingListData(), (item: SettingItem) => {
          ListItem() {
            this.settingCell(item)
          }
          .height($r('app.float.48vp'))
        }, (item: SettingItem) => JSON.stringify(item))
      }
      .backgroundColor(Color.White)
      .width(Constants.FULL_PARENT)
      .height(Constants.SET_LIST_WIDTH)
      .divider({
        strokeWidth: $r('app.float.1vp'),
        color: Color.Grey,
        startMargin: $r('app.float.42vp'),
        endMargin: $r('app.float.24vp')
      })
      .borderRadius($r('app.float.16vp'))
      .padding({ top: $r('app.float.4vp'), bottom: $r('app.float.4vp') })

      //3-推出

      Button('退出登录', { type: ButtonType.Capsule })
        .width(Constants.BUTTON_WIDTH)
        .height($r('app.float.40vp'))
        .fontSize($r('app.float.16fp'))
        .fontColor($r('app.color.fire_brick'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.gainsboro'))
        .margin({ bottom: $r('app.float.50vp') })
        .onClick(() => {
          SettingViewModel.logout()
        })

      Blank()

    }
    .height(Constants.FULL_PARENT)
  }
}