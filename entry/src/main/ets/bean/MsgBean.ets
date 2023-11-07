/**
 * @desc：4-消息
 */

export class MsgData {
  curPage: number = 0;
  datas: MsgItem[] = [];
  offset: number = 0;
  over: boolean = false;
  pageCount: number = 0;
  size: number = 0;
  total: number = 0;
}

export class MsgItem {
  category: number = 0;
  date: number = 0;
  fromUser: string = ''; //作者
  fromUserId: number = 0;
  fullLink: string = ''; //链接
  id: number = 0;
  isRead: number = 0;
  link: string = '';
  message: string = ''; //消息内容
  niceDate: string = ''; //日期
  tag: string = ''; //标签
  title: string = ''; //标题
  userId: number = 0;
}