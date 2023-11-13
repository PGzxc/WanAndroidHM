/**
 * @desc:3-Project-数据逻辑类
 */
import HttpConfig from '../api/HttpConfig';
import { projectListReq, projectReq } from '../api/HttpRequest';
import ResponseResult from '../api/ResponseResult';
import { ArticleList } from '../bean/ArticleBean';
import { ProjectData, ProjectItem } from '../bean/ProjectBean';
import Logger from '../utils/Logger';

class ProjectViewModel {

  //3-项目页面数据接口

  //项目分类
  getProject(): Promise<ProjectItem[]> {
    return new Promise(async (resolve: Function, reject: Function) => {
      projectReq().then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getProject failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
 //项目列表数据
  getProjectList(page: number, cid: number): Promise<ArticleList> {
    return new Promise(async (resolve: Function, reject: Function) => {
      projectListReq(page = page, cid = cid).then((data: ResponseResult) => {
        if (data.errorCode === HttpConfig.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('getProjectList failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'));
        }
      })
    })
  }
}

let projectViewModel = new ProjectViewModel();

export default projectViewModel as ProjectViewModel;