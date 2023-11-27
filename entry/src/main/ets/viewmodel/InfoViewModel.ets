/**
 * 积分排行或个人积分-数据类
 */
import HttpConfig from '../api/HttpConfig';
import { coinReq, rankReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { CoinData } from '../bean/CoinBean';
import { RankData } from '../bean/RankBean';
import Logger from '../utils/Logger';

class InfoViewModel {
  //1-排行榜
  getRank(page: number): Promise<RankData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      rankReq(page).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getRank failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }

  //2-签到积分
  getCoin(page: number): Promise<CoinData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      coinReq(page).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getRank failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let infoViewModel = new InfoViewModel();

export default infoViewModel as InfoViewModel;