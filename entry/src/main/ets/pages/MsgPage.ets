// 导入页面路由模块
import router from '@ohos.router';

/**
 * @desc:消息
 */

@Component
export default struct MsgPage {
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