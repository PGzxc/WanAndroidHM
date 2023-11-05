// 导入页面路由模块
import router from '@ohos.router';

/**
 * @desc:首页
 */

@Component
export default struct HomePage {
  build() {
    Row() {
      Column() {
        Text("首页")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}