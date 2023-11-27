// 导入页面路由模块
import router from '@ohos.router';
import { ProjectItem } from '../bean/ProjectBean';
import Constants from '../common/constants/Constants';
import TitleBar from '../view/TitleBar';
import TreeList from '../view/TreeList';
/**
 * @desc:7-导航-条目跳转页面
 */

@Preview
@Entry
@Component
export default struct TreeTabPage {
  private tabsController: TabsController = new TabsController()
  @State params: object = router.getParams();
  @State projectData: ProjectItem[] = [];
  @State currentIndex: number = 0;
  @State optionsDic: Map<number, number> = new Map();
  //页面即将显示时
  aboutToAppear() {
    //1-项目分类
    this.currentIndex = this.params['index']
    this.projectData = (this.params['data'] as ProjectItem).children
    this.projectData.forEach((project, index) => {
      this.optionsDic[index] = project.id //将tab_index对应的cid放到map中
    })
  }

  //自定义Tab
  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.projectData[index].name)
        .height(Constants.FULL_PERCENT)
        .fontSize(this.currentIndex === index ? $r('app.float.24fp') : $r('app.float.18fp'))
        .fontWeight(this.currentIndex === index ? Constants.TYPE_FONT_WEIGHT : Constants.DESC_FONT_WEIGHT)
        .fontColor($r('app.color.black'))
    }
    .padding({ left: $r('app.float.8vp'), right: $r('app.float.8vp') })
    .margin({
      left: index === 0 ? $r('app.float.8vp') : 0,
      right: index === this.projectData.length - 1 ? $r('app.float.8vp') : 0
    })
  }

  build() {
    Column() {
      TitleBar({ title: (this.params['data'] as ProjectItem).name })
      //Tabs
      Tabs({ barPosition: BarPosition.Start }) {
        ForEach(this.projectData, (projectItem: ProjectItem, index?: number) => {
          TabContent() {
            TreeList({ index, optionsDic: this.optionsDic, currentIndex: $currentIndex })
          }.tabBar(this.TabBuilder(index))
        }, (tabItem: ProjectItem) => JSON.stringify(tabItem))
      }
      .barHeight($r('app.float.50vp'))
      .height(Constants.FULL_PERCENT)
      .barMode(BarMode.Scrollable)
      .onChange((index: number) => {
        this.currentIndex = index;
        this.tabsController.changeIndex(this.currentIndex);
      })
      .vertical(false)
    }
  }
}