/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * @desc：网络请求工具类
 */

import http from '@ohos.net.http';
import ResponseResult from './ResponseResult';
import HttpConfig, { ContentType } from './HttpConfig';
import Constants from '../common/constants/Constants';
import preferences from '@ohos.data.preferences';
import * as Utils from "../utils/Utils";
import PreferencesUtils from '../utils/PreferencesUtils';
PersistentStorage.PersistProp(Constants.Cookie, '');
/**
 * Initiate an HTTP GET request to the specified URL.
 *
 * @param url URL for initiating an HTTP request.
 */
export function httpRequestGet(url: string) {
  return httpRequest(url, http.RequestMethod.GET);
}

/**
 * Initiate an HTTP POST request to the specified URL.
 *
 * @param url URL for initiating an HTTP request
 * @param newsData Additional data of the request
 * @returns
 */
export function httpRequestPost(url: string, params: Object) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request
 * @param method Request method.
 * @param extraData Additional data of the request.
 * @returns Returns {@link ResponseResult}.
 * @desc：说明：玩安卓官网的post请求使用extraData传递数据时，后台无法收到，故使用拼接的方式。其他平台的接口extraData可以传递数据。具体原因待研究
 */


function httpRequest(url: string, method: http.RequestMethod, params?: Object): Promise<ResponseResult> {

  let httpRequest = http.createHttp();
  let cookie1 = 'loginUserName_wanandroid_com=12345678;token_pass=08937b953a34ae42f65e461149b23129';
  let cookie3 = 'loginUserName_wanandroid_com=12345678;token_pass_wanandroid_com=08937b953a34ae42f65e461149b23129; Domain=wanandroid.com; Expires=Mon, 18-Dec-2023 08:20:48 GMT; Path=/'
  let cookie2 = 'loginUserName_wanandroid_com=12345678; token_pass_wanandroid_com=08937b953a34ae42f65e461149b23129; JSESSIONID=08D694B58BA92A81B0FA4648A9AA8E6E; loginUserName=12345678; token_pass=08937b953a34ae42f65e461149b23129';
  let cookie = PreferencesUtils.getStringData(Constants.Cookie)
  httpRequest.on('headersReceive', (header) => {
    //header['set-cookie'] = cookie;
    //header['Cookie'] = PreferencesUtils.getStringData(Constants.Cookie)
    //console.info('header: ' + JSON.stringify(header));
  });

  let responseResult = httpRequest.request(url, {
    method: method,
    extraData: params,
    //header: { 'Content-Type': method === http.RequestMethod.POST ? ContentType.FORM_URLENCODED : ContentType.JSON },
    header: {
      'Content-Type': ContentType.JSON,
      //'Cookie': PreferencesUtils.getStringData(Constants.Cookie),
      //'Cookie': cookie,
      'Cookie': AppStorage.Get(Constants.Cookie),
    },
    readTimeout: HttpConfig.HTTP_READ_TIMEOUT,
    connectTimeout: HttpConfig.HTTP_READ_TIMEOUT,
  });
  let serverData = new ResponseResult();

  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === HttpConfig.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      if (url.includes("login") && !Utils.isEmpty(value.header['set-cookie']) || url.includes("register") && !Utils.isEmpty(value.header['set-cookie'])) {
        AppStorage.Set(Constants.Cookie, `loginUserName_wanandroid_com=${params['username']};` + value.header['set-cookie'])
        //AppStorage.SetOrCreate('Cookie', `loginUserName_wanandroid_com=${params['username']};` + value.header['set-cookie'])
        //PersistentStorage.PersistProp('Cookie', `loginUserName_wanandroid_com=${params['username']};`+value.header['set-cookie']);
        //PreferencesUtils.putStringData(Constants.Cookie, `loginUserName_wanandroid_com=${params['username']};`+value.header['set-cookie'])
      }
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.errorCode = resultJson.errorCode;
      serverData.errorMsg = resultJson.errorMsg;
    } else {
      serverData.errorMsg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.errorMsg = $r('app.string.http_error_message');
    return serverData;
  });
}
