// 导入页面路由模块
import router from '@ohos.router';

/**
 * @desc:导航
 */

@Component
export default struct NavPage {
  build() {
    Row() {
      Column() {
        Text("导航")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}