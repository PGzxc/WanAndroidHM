/**
 * @desc：5-用户数据
 */

export class UserData {
  coinInfo: CoinInfo = new CoinInfo();
  userInfo: UserInfo = new UserInfo()
}

export class UserInfo {
  admin: boolean = false;
  chapterTops: [] = [];
  coinCount: number = 0;
  collectIds: [] = [];
  email: string = '';
  icon: string = '';
  id: number = 0;
  nickname: string = '';
  password: string = '';
  publicName: string = '';
  token: string = '';
  type: number = 0;
  username: string = '';
}

export class CoinInfo {
  coinCount: number = 0; // 可用
  level: number = 0; // 可用
  nickname: string = '';
  rank: string = ''; // 可用
  userId: number = 0; // 可用
  username: string = '';
}