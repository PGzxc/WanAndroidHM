/**
 * @desc：体系-知识导航-列表
 */
import { Article, ArticleList } from '../bean/ArticleBean';
import Constants from '../common/constants/Constants';
import { NavigatorModel } from '../viewmodel/NavigatorModel';
import TreeViewModel from '../viewmodel/TreeViewModel';
import ArticleItem from './ArticleItem';
import * as Utils from "../utils/Utils";

@Component
export default struct TreeList {
  index: number = 0;
  optionsDic: Map<number, number> = new Map
  @Watch('changeTab') @Link currentIndex: number;
  @State articleListData: ArticleList = new ArticleList();

  //与@Watch('changeTab')中的changeTab保持一致。 @Watch装饰器：状态变量更改通知  @Link装饰器：父子双向同步
  changeTab() {

    //2-项目列表,page从0开始
    TreeViewModel.getTreeArticleList(0, this.optionsDic[this.currentIndex]).then((data: ArticleList) => {
      console.log('getProjectList>>>', data)
      this.articleListData = data
    })
  }

  aboutToAppear() {
    // Load data.
    this.changeTab()
  }

  @Builder
  NoView() {
    Text('暂时没有数据哦')
      .textAlign(TextAlign.Center)
      .width('100%')
      .height('100%')
  }

  @Builder
  ListView() {
    List() {
      ForEach(this.articleListData.datas, (article: Article) => {
        ListItem() {
          Navigator({ target: "pages/WebPage", type: NavigationType.Push }) {
            ArticleItem({ article: article })
          }.params({ path: article.link, title: article.title } as NavigatorModel)
        }
      })
    }.width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }

  build() {
    if (Utils.isEmpty(this.articleListData.datas)) {
      this.NoView()
    } else {
      this.ListView()
    }
  }
}
