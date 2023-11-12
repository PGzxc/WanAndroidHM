// 导入页面路由模块
import router from '@ohos.router';
import HttpConfig from '../api/HttpConfig';
import { Article, ArticleList, ArticleTop } from '../bean/ArticleBean';
import { Banner } from '../bean/BannerBean';
import Constants from '../common/constants/Constants';
import Logger from '../utils/Logger';
import ArticleItem from '../view/ArticleItem';
import HomeViewModel from '../viewmodel/HomeViewModel';

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


  //页面即将显示时
  aboutToAppear() {

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
    //2-首页-文章接口数据
    HomeViewModel.getArticle(0).then(result => {
      var aa = this.bannerData;
      result.datas.forEach((article, index) => {
        console.log('article>>>', article)
      })
      console.log('article>>>', JSON.stringify(result))
    })
  }

  build() {
    Scroll() {
      Column() {
        if (this.bannerData.length > 0) {
          Swiper(this.swiperController) {
            ForEach(this.bannerData, (banner: Banner) => {
              Image(banner.imagePath)
            }, (img: Resource) => JSON.stringify(img.id))
          }.height(200).width('100%')
          .autoPlay(true)
        }
        //Article
        List() {
          ForEach(this.articleData, (article: Article) => {
            ListItem() {
              ArticleItem({ article: article })
            }
          })
        }
      }
    }.height(Constants.FULL_PERCENT)
  }
}