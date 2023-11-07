// 导入页面路由模块
import router from '@ohos.router';
import MsgViewModel from '../viewmodel/MsgViewModel';

/**
 * @desc:4-消息
 */

@Component
export default struct MsgPage {

  //页面即将显示时
  aboutToAppear() {
    //1-未读消息
    MsgViewModel.getMsgUnRead().then(result => {
      console.log('unreadMsg>>>', result)
    })
    //2-已读消息
    MsgViewModel.getMsgRead(1).then(result => {
      console.log('readMsg>>>', result)
    })

  }

  build() {
    Row() {
      Column() {
        Text("消息")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}