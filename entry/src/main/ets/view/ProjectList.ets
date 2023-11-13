/**
 * @desc：项目-列表
 */
import { Article, ArticleList } from '../bean/ArticleBean';
import ProjectViewModel from '../viewmodel/ProjectViewModel';
import ArticleItem from './ArticleItem';

@Component
export default struct ProjectList {
  index: number = 0;
  optionsDic: Map<number, number> = new Map
  @Watch('changeTab') @Link currentIndex: number;
  @State articleListData: ArticleList = new ArticleList();

  //与@Watch('changeTab')中的changeTab保持一致。 @Watch装饰器：状态变量更改通知  @Link装饰器：父子双向同步
  changeTab() {
    if (this.currentIndex !== this.index) {
      return;
    }
    //2-项目列表
    ProjectViewModel.getProjectList(1, this.optionsDic[this.currentIndex]).then((data: ArticleList) => {
      console.log('getProjectList>>>', data)
      this.articleListData = data
    })
    // ProjectViewModel.getProjectList(1, 294).then((data: ArticleList) => {
    //   this.articleListData = data
    // })
  }

  aboutToAppear() {
    // Load data.
    this.changeTab()
  }

  build() {
    //Article
    List() {
      ForEach(this.articleListData.datas, (article: Article) => {
        ListItem() {
          ArticleItem({ article: article })
        }
      })
    }
  }
}
