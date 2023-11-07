// 导入页面路由模块
import router from '@ohos.router';
import HttpConfig from '../api/HttpConfig';
import { Banner } from '../bean/BannerBean';
import Logger from '../utils/Logger';
import HomeViewModel from '../viewmodel/HomeViewModel';

/**
 * @desc:1-首页
 */

@Entry
@Component
export default struct HomePage {
  //页面即将显示时
  aboutToAppear() {

    //1-首页全部接口数据
    HomeViewModel.getHomeData().then(result => {

      //1-result[0]-Banner
      let bannerData = result[0]
      //2-result[1]-置顶文章
      let articleTopData = result[1]
      //3-result[3] - 文章列表
      let articleListData = result[2]


    })
    //2-首页-文章接口数据
    HomeViewModel.getArticle(0).then(result => {
      result.datas.forEach((article, index) => {
        console.log('article>>>', article)
      })
      console.log('article>>>', JSON.stringify(result))
    })
  }

  build() {
    Row() {
      Column() {
        Text("首页")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}