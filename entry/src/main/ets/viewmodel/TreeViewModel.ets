/**
 * @desc:2-Nav-数据逻辑类
 */
import HttpConfig from '../api/HttpConfig';
import { treeListReq, treeReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { TreeArticle, TreeData, TreeItem } from '../bean/TreeBean';
import Logger from '../utils/Logger';

class TreeViewModel {

  //2-Tree(导航)页面数据接口

  getTreeData(): Promise<TreeItem[]> {
    return new Promise(async (resolve: Function, reject: Function) => {
      treeReq().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getTreeData failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
  //2-知识体系下的文章
  getTreeArticleList(page: number, cid: number): Promise<TreeArticle> {
    return new Promise(async (resolve: Function, reject: Function) => {
      treeListReq(page = page, cid = cid).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getTreeArticleList failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let treeViewModel = new TreeViewModel();

export default treeViewModel as TreeViewModel;