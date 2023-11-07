// 导入页面路由模块
import router from '@ohos.router';
import MeViewModel from '../viewmodel/MeViewModel';

/**
 * @desc:5-我的
 */

@Component
export default struct MePage {
  aboutToAppear() {
    //1-个人信息接口
    MeViewModel.getUserInfo().then(result => {
      console.log('UserInfo>>>', result)
    })
  }

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