// 导入页面路由模块
import { Article, ArticleList, ArticleTop } from '../bean/ArticleBean';
import { Banner } from '../bean/BannerBean';
import ArticleItem from '../view/ArticleItem';
import HomeViewModel from '../viewmodel/HomeViewModel';
import { NavigatorModel } from '../viewmodel/NavigatorModel';
import { PullToRefresh } from '@ohos/pulltorefresh'
import * as Utils from "../utils/Utils";
import prompt from '@ohos.promptAction';
import Constants from '../common/constants/Constants';

/**
 * @desc:1-首页
 */

@Entry
@Component
export default struct HomePage {
  private swiperController: SwiperController = new SwiperController();
  @State bannerData: Banner[] = [];
  @State articleTopData: Article[] = [];
  @State articleListData: ArticleList = new ArticleList()
  @State articleData: Article[] = [];
  @State pageNum: number = 0; //分页page
  private scroller: Scroller = new Scroller(); // 需绑定列表或宫格组件

  //页面即将显示时
  async aboutToAppear() {
    //1-首页全部接口数据
    this.getHomeBannerData()
    //2-首页-文章接口数据
    //this.getHomeArticleListData(0)
  }

  //1-首页全部接口数据
  getHomeBannerData() {
    //1-首页全部接口数据
    HomeViewModel.getHomeData().then(result => {
      this.bannerData = result[0] as Banner[]
      this.articleTopData = (result[1] as Article[])
      this.articleTopData.forEach(item => {
        item.isTop = true
      })
      this.articleListData = result[2]

      this.articleData = [...this.articleTopData, ...this.articleListData.datas]
      console.log("result")
    })
  }

  //2-首页-文章接口数据
  getHomeArticleListData(page: number) {
    //2-首页-文章接口数据
    HomeViewModel.getArticle(page).then(result => {
      this.articleData.push(...result.datas)
      // result.datas.forEach((article, index) => {
      //   console.log('article>>>', article)
      //   this.articleData.push(article)
      // })
      console.log('article>>>', JSON.stringify(result))
    })
  }

  @Builder
  private homeListView() {
    //Article
    List({ scroller: this.scroller }) {
      //Banner轮播图
      ListItem() {
        if (this.bannerData.length > 0) {
          Swiper(this.swiperController) {
            ForEach(this.bannerData, (banner: Banner) => {
              Navigator({ target: Constants.WebPage_Path, type: NavigationType.Push }) {
                Image(banner.imagePath)
              }.params({ path: banner.url, title: banner.title } as NavigatorModel)
            }, (img: Resource) => JSON.stringify(img.id))
          }.height(200).width('100%')
          .autoPlay(true)
        }
      }

      //文章条目
      ForEach(this.articleData, (article: Article) => {
        ListItem() {
          Navigator({ target: Constants.WebPage_Path, type: NavigationType.Push }) {
            ArticleItem({ article: article })
          }.params({ path: article.link, title: article.title } as NavigatorModel)
        }
      })
    }
    .edgeEffect(EdgeEffect.None) // 必须设置列表为滑动到边缘无效果
  }

  build() {
    Column() {
      PullToRefresh({
        data: this.articleData,
        scroller: this.scroller,
        customList: () => this.homeListView(),
        onRefresh: () => {
          return new Promise<string>((resolve, reject) => {
            setTimeout(() => {
              resolve('刷新成功');
              this.pageNum = 0;
              this.articleData.forEach((item, index) => {
                this.articleData.pop()
              })
              this.getHomeArticleListData(this.pageNum)
            }, 1000);
          });
        },
        onLoadMore: () => {
          return new Promise<string>((resolve, reject) => {
            setTimeout(() => {
              resolve('onLoadMore');
              if (!this.articleListData.over) {
                this.getHomeArticleListData(++this.pageNum)
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