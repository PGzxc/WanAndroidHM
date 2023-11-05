// 导入页面路由模块
import router from '@ohos.router';

/**
 * @desc:我的
 */

@Component
export default struct MePage {
  build() {
    Row() {
      Column() {
        Text("我的")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}