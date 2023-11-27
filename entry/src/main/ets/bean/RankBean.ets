/**
 * 积分排行-数据类
 */

export class RankData {
  curPage: number = 0;
  datas: RankItem[] = [];
  offset: number = 0;
  over: boolean = false;
  pageCount: number = 0;
  size: number = 0;
  total: number = 0;
}


export class RankItem {
  coinCount: number = 0;
  level: number = 0;
  nickname: string = '';
  rank: string = '';
  userId: number = 0;
  username: string = '';
}