import HttpConfig from './HttpConfig';
import { httpRequestGet, httpRequestPost } from './HttpService';
import ResponseResult from './ResponseResult';

/**
 * @desc：Http网络请求
 */

//1-home(首页)
const bannerReq = ():Promise<ResponseResult> => httpRequestGet(HttpConfig.bannerUrl);
const articleTopReq = ():Promise<ResponseResult> => httpRequestGet(HttpConfig.articleTopUrl);
const articleListReq = (page: number):Promise<ResponseResult> => httpRequestGet(`${HttpConfig.articleListUrl}/${page}/json`);

//2-nav(导航)
const treeReq = ():Promise<ResponseResult> => httpRequestGet(HttpConfig.treeUrl);
const treeListReq = (page: number, cid: number):Promise<ResponseResult> => httpRequestGet(`${HttpConfig.treeListUrl}/${page}/json?cid=${cid}`);

//3-project(项目)
const projectReq = ():Promise<ResponseResult> => httpRequestGet(HttpConfig.projectUrl);
const projectListReq = (page: number, cid: number):Promise<ResponseResult> => httpRequestGet(`${HttpConfig.projectListUrl}/${page}/json?cid=${cid}`);

//4-msg(消息)
const msgUnReadReq = ():Promise<ResponseResult> =>httpRequestGet(HttpConfig.msgUnreadUrl);
const msgReadReq = (page: number):Promise<ResponseResult>=>httpRequestGet(`${HttpConfig.msgReadUrl}/${page}/json`);

//5-me(我的)

const userReq = ():Promise<ResponseResult> => httpRequestGet(HttpConfig.userInfUrl);


//6-login(登录)、register(注册)
const loginReq =  (username:string,password:string):Promise<ResponseResult> =>httpRequestPost(`${HttpConfig.loginUrl}?username=${username}&password=${password}`,Object({'username':username,"password":password}));
const registerReq =  (username:string,password:string,repassword:string):Promise<ResponseResult> =>httpRequestPost(`${HttpConfig.registerUrl}?username=${username}&password=${password}&repassword=${repassword}`,Object({'username':username,'password':password,'repassword':repassword}));
const logoutReq = ():Promise<ResponseResult> => httpRequestGet(HttpConfig.logoutUrl);

//7-排行榜(rank)、积分(coin-需登录)
const rankReq = (page: number):Promise<ResponseResult>=>httpRequestGet(`${HttpConfig.rankUrl}/${page}/json`);
const coinReq = (page: number):Promise<ResponseResult>=>httpRequestGet(`${HttpConfig.coinUrl}/${page}/json`);

export {
  bannerReq, articleTopReq, articleListReq,
  treeReq,treeListReq,
  projectReq,projectListReq,
  msgUnReadReq,msgReadReq,
  userReq,
  loginReq,registerReq,logoutReq,
  rankReq,coinReq
}