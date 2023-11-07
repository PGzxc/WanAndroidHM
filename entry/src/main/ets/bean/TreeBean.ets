/**
 * @desc：2-Tree(导航)-数据类
 */
import { Article } from './ArticleBean';

//体系数据
export class TreeData {
  data: TreeItem[] = [];
}

export class TreeItem {
  articleList: [] = [];
  author: string = '';
  children: TreeItem[] = [];
  courseId: number = 0;
  cover: string = '';
  desc: string = '';
  id: number = 0;
  lisense: string = '';
  lisenseLink: string = '';
  name: string = '';
  order: number = 0;
  parentChapterId: number = 0;
  type: number = 0;
  userControlSetTop: boolean = false;
  visible: number = 0;
}
//知识体系下的文章
export class TreeArticle {
  curPage: number = 1;
  offset: number = 0;
  over: boolean = false;
  pageCount: number = 0;
  size: number = 0;
  total: number = 0;
  datas: Article[] = [];
}