/**
 * @desc：消息-未/已读消息Item
 */
import Constants from '../common/constants/Constants'

import { MsgData, MsgItem } from '../bean/MsgBean'


@Entry
@Component
export default struct MsgItemView {
  msgItem: MsgItem = null
  @State msg: string = ''
  @State content: string = 'kotlin 协程，CoroutineScope 调用 cancel() 后，无法再次执行 launch，如何理解这块。如下代码val scope = CoroutineScope(Dispatchers.Main)scope.launch Log.d(TAG, "cancelJob: before cancel")...'

  build() {
    Column() {
      //第一行
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Row() {
          Image($r('app.media.ic_me_normal')).width($r('app.float.18vp')).height($r('app.float.18vp'))
          Text(this.msgItem.fromUser).margin({ left: $r('app.float.5vp') }) //2-author
        }.margin({ left: $r('app.float.5vp'), right: $r('app.float.5vp') })

        Text(this.msgItem.tag)
          .height($r('app.float.23vp'))
          .fontSize($r('app.float.12fp'))
          .textAlign(TextAlign.Center)
          .maxLines(1)
          .borderRadius($r('app.float.3vp'))
          .fontColor($r('app.color.white'))
          .backgroundColor($r('app.color.fire_brick'))
          .padding({
            left: $r('app.float.10vp'),
            right: $r('app.float.10vp'),
          })

        Row() {
          Image($r('app.media.ic_clock')).width($r('app.float.18vp')).height($r('app.float.18vp'))
          Text(this.msgItem.niceDate).margin({ left: $r('app.float.5vp') }) //2-author
        }.margin({ left: $r('app.float.5vp'), right: $r('app.float.5vp') })
      }
      //第2行呢容
      Text(this.msgItem.title)
        .height($r('app.float.30vp'))
        .fontSize($r('app.float.12fp'))
        .textAlign(TextAlign.Start)
        .borderRadius($r('app.float.3vp'))
        .fontColor($r('app.color.white'))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width(Constants.FULL_PERCENT)
        .borderRadius(6)
        .backgroundColor($r('app.color.royal_blue'))
        .margin({ top: $r('app.float.10vp') })
        .padding({
          left: $r('app.float.10vp'),
          right: $r('app.float.10vp'),
          top: $r('app.float.5vp'),
          bottom: $r('app.float.5vp')
        })
      //第3行呢容
      Text(this.msgItem.message)
        .textAlign(TextAlign.Start)
        .width(Constants.FULL_PERCENT)
        .maxLines(3)
        .margin({ top: $r('app.float.10vp') })
    }
    .padding(10)
    .backgroundColor($r('app.color.white_smoke'))
    .borderWidth(5)
    .borderColor($r('app.color.light_gray'))
  }
}