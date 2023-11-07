import HttpConfig from './HttpConfig';
import { httpRequestGet, httpRequestPost } from './HttpService';
/**
 * @desc：Http网络请求
 */

//1-home(首页)
const bannerReq = () => httpRequestGet(HttpConfig.bannerUrl);
const articleTopReq = () => httpRequestGet(HttpConfig.articleTopUrl);
const articleListReq = (page: number) => httpRequestGet(`${HttpConfig.articleListUrl}/${page}/json`);

//2-nav(导航)
const treeReq = () => httpRequestGet(HttpConfig.treeUrl);
const treeListReq = (page: number, cid: number) => httpRequestGet(`${HttpConfig.treeListUrl}/${page}/json?cid=${cid}`);

//3-project(项目)
const projectReq = () => httpRequestGet(HttpConfig.projectUrl);
const projectListReq = (page: number, cid: number) => httpRequestGet(`${HttpConfig.projectListUrl}/${page}/json?cid=${cid}`);

//4-msg(消息)
const msgUnReadReq = () =>httpRequestGet(HttpConfig.msgUnreadUrl);
const msgReadReq = (page: number)=>httpRequestGet(`${HttpConfig.msgReadUrl}/${page}/json`);

//5-me(我的)

const userReq = () => httpRequestGet(HttpConfig.userInfUrl);


//6-login(登录)、register(注册)
const loginReq =  (username:string,password:string) =>httpRequestPost(HttpConfig.loginUrl,{'username':username,'password':password});
const registerReq =  (username:string,password:string,repassword:string) =>httpRequestPost(HttpConfig.loginUrl,{'username':username,'password':password,'repassword':repassword});
const logoutReq = () => httpRequestGet(HttpConfig.logoutUrl);


export {
  bannerReq, articleTopReq, articleListReq,
  treeReq,treeListReq,
  projectReq,projectListReq,
  msgUnReadReq,msgReadReq,
  userReq,
  loginReq,registerReq,logoutReq
}