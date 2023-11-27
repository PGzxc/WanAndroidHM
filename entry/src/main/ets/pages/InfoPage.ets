/**
 * 积分排行或个人积分页面
 */
import router from '@ohos.router';
import { CoinData, CoinItem } from '../bean/CoinBean';
import { RankData, RankItem } from '../bean/RankBean';
import Constants from '../common/constants/Constants';
import InfoItem from '../view/InfoItem';
import TitleBar from '../view/TitleBar'
import InfoViewModel from '../viewmodel/InfoViewModel';

@Preview
@Entry
@Component
struct InfoPage {
  @State params: object = router.getParams();
  @State title: string = '';
  //积分数据
  @State coinData: CoinData = new CoinData;
  @State coinListData: CoinItem[] = [];
  //排行榜数据
  @State rankData: RankData = new RankData;
  @State rankListData: RankItem[] = [];

  aboutToAppear() {
    switch (this.params['title']) {
      case Constants.RANK:
        this.title = '积分排行榜';
        this.getRankData(1)

        break;
      case Constants.COIN:
        this.title = '个人积分列表';
        this.getCoinData(1)
        break;
      default:
        this.title = '其他';
        break;
    }
  }

  getRankData(page: number) {
    InfoViewModel.getRank(1).then((rankData: RankData) => {
      this.rankData = rankData;
      this.rankListData = rankData.datas
    })
  }

  getCoinData(page: number) {
    InfoViewModel.getCoin(1).then((coinData: CoinData) => {
      this.coinData = coinData;
      this.coinListData = coinData.datas;
    })
  }

  @Builder
  listRank() {
    List({ space: 10 }) {
      ForEach(this.rankListData, (item: RankItem, index) => {
        ListItem() {
          InfoItem({
            param1: `排名：${item.rank}`,
            param2: `用户名：${item.username}`,
            param3: `用户等级：${item.level}`,
            param4: `用户积分：${item.coinCount}`,
          })
        }
      })
    }
  }

  @Builder
  listCoin() {
    List({ space: 10 }) {
      ForEach(this.coinListData, (item: CoinItem, index) => {
        ListItem() {
          InfoItem({
            param1: `类型：${item.reason}`,
            param2: `获得积分：${item.coinCount}`,
            param3: `用户等级：${item.desc}`,
          })
        }
      })
    }
  }

  build() {
    Column() {
      //1-头部
      TitleBar({ title: this.title })
      if (this.params['title'] === Constants.RANK) {
        this.listRank()
      } else if (this.params['title'] === Constants.COIN) {
        this.listCoin()
      }
    }
  }
}