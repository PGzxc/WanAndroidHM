// 导入页面路由模块
import router from '@ohos.router';
import ProjectViewModel from '../viewmodel/ProjectViewModel';

/**
 * @desc:3-项目
 */

@Component
export default struct ProjectPage {

  //页面即将显示时
  aboutToAppear() {
    //1-项目分类
    ProjectViewModel.getProject().then(result => {
      console.log('project>>>', result)
    })
    //2-项目列表
    ProjectViewModel.getProjectList(1, 294).then(result => {
      console.log('getProjectList>>>', result)
    })
  }

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