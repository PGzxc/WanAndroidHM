// 导入页面路由模块
import router from '@ohos.router';
import { ProjectItem } from '../bean/ProjectBean';
import Constants from '../common/constants/Constants';
import ProjectList from '../view/ProjectList';
import ProjectViewModel from '../viewmodel/ProjectViewModel';

/**
 * @desc:3-项目
 */
@Preview
@Component
export default struct ProjectPage {
  @State projectData: ProjectItem[] = [];
  @State currentIndex: number = 0;
  @State optionsDic: Map<number, number> = new Map();
  //页面即将显示时
  aboutToAppear() {
    //1-项目分类
    ProjectViewModel.getProject().then((result: ProjectItem[]) => {
      console.log('project>>>', result)
      this.projectData = result
      this.projectData.forEach((project, index) => {
        this.optionsDic[index] = project.id //将tab_index对应的cid放到map中
      })
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
    Tabs({ barPosition: BarPosition.Start }) {
      ForEach(this.projectData, (projectItem: ProjectItem, index?: number) => {
        TabContent() {
          ProjectList({ index, optionsDic: this.optionsDic, currentIndex: $currentIndex })
        }.tabBar(this.TabBuilder(index))
      }, (tabItem: ProjectItem) => JSON.stringify(tabItem))
    }
    .barHeight($r('app.float.50vp'))
    .height(Constants.FULL_PERCENT)
    .barMode(BarMode.Scrollable)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
    .vertical(false)
  }
}