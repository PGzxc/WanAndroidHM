// 导入页面路由模块
import router from '@ohos.router';
import TreeViewModel from '../viewmodel/TreeViewModel';

/**
 * @desc:2-导航
 */

@Component
export default struct TreePage {
  //页面即将显示时
  aboutToAppear() {
    //1-体系数据
    TreeViewModel.getTreeData().then(result => {
      console.log('tree>>>', result)
    })
    //2-知识体系下的文章
    TreeViewModel.getTreeArticleList(0, 60).then(result => {
      console.log('treeArticle>>>', result)
    })
  }

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