/**
 * 积分排行-数据类
 */

export class CoinData {
  curPage: number = 0;
  datas: CoinItem[] = [];
  offset: number = 0;
  over: boolean = false;
  pageCount: number = 0;
  size: number = 0;
  total: number = 0;
}


export class CoinItem {
  coinCount: number = 0;
  date: number = 0;
  desc: string = '';
  id: number = 0;
  reason: string = '';
  type: number = 0;
  userId: number = 0;
  username: string = '';
}