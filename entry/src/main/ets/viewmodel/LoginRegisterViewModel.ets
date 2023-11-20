/**
 * @desc:5-登录、注册-数据逻辑类
 */
import HttpConfig from '../api/HttpConfig';
import { loginReq, registerReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { UserInfo } from '../bean/UserInfoBean';
import Logger from '../utils/Logger';


class LoginRegisterViewModel {

  //用户登录
  userLogin(username: string, password: string): Promise<ResponseResult> {
    return new Promise(async (resolve: Function, reject: Function) => {
      loginReq(username, password).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data);
        } else {
          Logger.error('userLogin failed', JSON.stringify(data));
          resolve(data);
          //reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
  //用户注册
  userRegister(username: string, password: string, repassword: string): Promise<ResponseResult> {
    return new Promise(async (resolve: Function, reject: Function) => {
      registerReq(username, password, repassword).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data);
        } else {
          Logger.error('userRegister failed', JSON.stringify(data));
          resolve(data);
          //reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let loginRegisterViewModel = new LoginRegisterViewModel();

export default loginRegisterViewModel as LoginRegisterViewModel;