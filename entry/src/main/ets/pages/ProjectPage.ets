// 导入页面路由模块
import router from '@ohos.router';

/**
 * @desc:项目
 */

@Component
export default struct ProjectPage {
  build() {
    Row() {
      Column() {
        Text("项目")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}