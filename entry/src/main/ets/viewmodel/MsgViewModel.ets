/**
 * @desc:4-Msg-数据逻辑类
 */
import HttpConfig from '../api/HttpConfig';
import { msgReadReq, msgUnReadReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { MsgData } from '../bean/MsgBean';
import Logger from '../utils/Logger';

class MsgViewModel {

  //1-导航页面数据接口

  //未读消息
  getMsgUnRead(): Promise<MsgData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      msgUnReadReq().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getMsgUnRead failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }

  //已读消息
  getMsgRead(page:number): Promise<MsgData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      msgReadReq(page).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getMsgUnRead failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let msgViewModel = new MsgViewModel();

export default msgViewModel as MsgViewModel;