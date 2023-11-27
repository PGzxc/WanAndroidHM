/**
 * @desc：体系-知识导航-列表
 */
import { Article, ArticleList } from '../bean/ArticleBean';
import Constants from '../common/constants/Constants';
import { NavigatorModel } from '../viewmodel/NavigatorModel';
import TreeViewModel from '../viewmodel/TreeViewModel';
import ArticleItem from './ArticleItem';
import * as Utils from "../utils/Utils";
import { PullToRefresh } from '@ohos/pulltorefresh'
import prompt from '@ohos.promptAction';

@Component
export default struct TreeList {
  index: number = 0;
  optionsDic: Map<number, number> = new Map
  @Watch('changeTab') @Link currentIndex: number;
  @State articleListData: ArticleList = new ArticleList();
  @State articleData: Article[] = [];
  @State pageNum: number = 0; //分页page
  private scroller: Scroller = new Scroller(); // 需绑定列表或宫格组件

  aboutToAppear() {
    // Load data.
    this.changeTab()
  }

  //与@Watch('changeTab')中的changeTab保持一致。 @Watch装饰器：状态变量更改通知  @Link装饰器：父子双向同步
  changeTab() {
    //2-项目列表,page从0开始
    this.getTreeListData(this.pageNum);

  }

  getTreeListData(page: number) {
    //2-项目列表,page从1开始
    TreeViewModel.getTreeArticleList(page, this.optionsDic[this.currentIndex]).then((data: ArticleList) => {
      console.log('getProjectList>>>', data)
      this.articleListData = data
      this.articleData.push(...data.datas)
    })
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
    List({ scroller: this.scroller }) {
      ForEach(this.articleData, (article: Article) => {
        ListItem() {
          Navigator({ target: Constants.WebPage_Path, type: NavigationType.Push }) {
            ArticleItem({ article: article })
          }.params({ path: article.link, title: article.title } as NavigatorModel)
        }
      })
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .edgeEffect(EdgeEffect.None) // 必须设置列表为滑动到边缘无效果
  }

  build() {
    if (Utils.isEmpty(this.articleData)) {
      this.NoView()
    } else {
      Column() {
        PullToRefresh({
          data: this.articleData,
          scroller: this.scroller,
          customList: () => this.ListView(),
          onRefresh: () => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                resolve('刷新成功');
                //this.articleData = null
                this.pageNum = 0;
                this.getTreeListData(this.pageNum)
              }, 1000);
            });
          },
          onLoadMore: () => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                resolve('onLoadMore');
                if (!this.articleListData.over) {
                  this.getTreeListData(++this.pageNum)
                } else {
                  prompt.showToast({ message: $r('app.string.no_more_data') })
                }
              }, 1000);
            });
          },
          customLoad: null,
          customRefresh: null,
        })
      }
    }
  }
}
