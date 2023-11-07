/**
 * @desc:1-home-数据逻辑类
 */
import List from '@ohos.util.List';
import HttpConfig from '../api/HttpConfig';
import { articleListReq, articleTopReq, bannerReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { ArticleList, ArticleTop } from '../bean/ArticleBean';
import { Banner } from '../bean/BannerBean';
import Logger from '../utils/Logger';
/**
 * @desc：HomePage对应数据处理类
 */
class HomeViewModel {
  //首页-banner轮播图、置顶文章、文章三个接口
  getHomeData() {
    return Promise.all([this.getBanner(), this.getArticleTop(), this.getArticle(0)])
  }
  //1-首页-Banner
  getBanner(): Promise<List<Banner>> {
    return new Promise(async (resolve: Function, reject: Function) => {
      bannerReq().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getBanner failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
  //2-首页-置顶
  getArticleTop(): Promise<ArticleTop> {
    return new Promise(async (resolve: Function, reject: Function) => {
      articleTopReq().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getArticleTop failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
  //3-首页-文章
  getArticle(page: number): Promise<ArticleList> {
    return new Promise(async (resolve: Function, reject: Function) => {
      articleListReq(page).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getArticle failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;

