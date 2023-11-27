// 导入页面路由模块
import router from '@ohos.router';
import { TreeItem } from '../bean/TreeBean';
import Constants from '../common/constants/Constants';
import TreeViewModel from '../viewmodel/TreeViewModel';

/**
 * @desc:2-导航
 */
@Entry
@Component
export default struct TreePage {
  @State treeData: TreeItem[] = [];

  //页面即将显示时
  aboutToAppear() {
    //1-体系数据
    TreeViewModel.getTreeData().then(result => {
      console.log('tree>>>', result)
      this.treeData = result
    })
    //2-知识体系下的文章
    TreeViewModel.getTreeArticleList(0, 60).then(result => {
      console.log('treeArticle>>>', result)
    })
  }

  //分组-头部组件
  @Builder
  itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize($r('app.float.20fp'))
      .fontWeight(FontWeight.Bold)
      .backgroundColor($r('app.color.light_gray'))
      .width('100%')
      .padding(5)
  }

  build() {
    List() {
      ForEach(this.treeData, treeItem => {
        ListItemGroup({ header: this.itemHead(treeItem.name) }) {
          //循环渲染ListItem
          ListItem() {
            Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceEvenly }) {
              ForEach(treeItem.children, (item: TreeItem, index) => {
                Navigator({ target: Constants.TreeTabPage_Path, type: NavigationType.Push }) {
                  Text(item.name)
                    .textAlign(TextAlign.Center)
                    .height($r('app.float.30vp'))
                    .border({ width: 1 })
                    .borderColor(Color.Black)
                    .borderRadius(2)
                    .padding({
                      top: $r('app.float.2vp'),
                      bottom: $r('app.float.2vp'),
                      left: $r('app.float.5vp'),
                      right: $r('app.float.5vp')
                    })
                    .margin($r('app.float.5vp'))
                }.params({ index: index, data: treeItem })
              })
            }.width('90%').padding($r('app.float.10vp'))
          }
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}