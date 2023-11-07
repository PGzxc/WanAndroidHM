/**
 * @desc:5-Me-数据逻辑类
 */
import HttpConfig from '../api/HttpConfig';
import { userReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { userInfo } from '../bean/UserInfoBean';
import Logger from '../utils/Logger';

class MeViewModel {

  //5-我的页面数据接口
  getUserInfo(): Promise<userInfo> {
    return new Promise(async (resolve: Function, reject: Function) => {
      userReq().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getUserInfo failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let meViewModel = new MeViewModel();

export default meViewModel as MeViewModel;