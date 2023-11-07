// 导入页面路由模块
import router from '@ohos.router';

/**
 * @desc: 6-登录注册页面
 */
@Entry
@Component
export default struct LoginRegisterPage {
  build() {
    Row() {
      Column() {
        Text("登录注册页面")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}