/**
 * @desc：消息-已读消息
 */
import { MsgData, MsgItem } from '../bean/MsgBean'
import MsgViewModel from '../viewmodel/MsgViewModel'
import MsgItemView from './MsgItemView'
import * as Utils from "../utils/Utils";
import { NavigatorModel } from '../viewmodel/NavigatorModel';
import Constants from '../common/constants/Constants';
import router from '@ohos.router';


@Component
export default struct MsgReadList {
  @State msgList: MsgItem[] = []

  aboutToAppear() {
    MsgViewModel.getMsgRead(1).then((msgData: MsgData) => {
      this.msgList = msgData.datas
      console.log('readMsg>>>', msgData)
    })
  }

  @Builder
  MsgDataView() {
    Scroll() {
      Column() {
        ForEach(this.msgList, (item: MsgItem, index) => {
          Navigator({ target: Constants.WebPage_Path, type: NavigationType.Push }) {
            MsgItemView({ msgItem: item })
          }.params({ path: item.link, title: item.title } as NavigatorModel)
        })
      }
    }
  }

  @Builder
  MsgNoLoginView() {
    Text('登录后查看消息')
      .textAlign(TextAlign.Center)
      //.width('100%')
      //.height('100%')
      .backgroundColor($r('app.color.deep_sky_blue'))
      .padding({top:$r('app.float.10vp'),bottom:$r('app.float.10vp'),left:$r('app.float.20vp'),right:$r('app.float.20vp')})
      .borderRadius($r('app.float.5vp'))
      .onClick(() => {
        router.pushUrl({
          url: Constants.LoginRegister_Path // 目标url
        })
      })
  }

  @Builder
  MsgNoView() {
    Text('暂时没有数据哦')
      .textAlign(TextAlign.Center)
      .width('100%')
      .height('100%')
  }

  build() {
    if (!Utils.isEmpty(AppStorage.Get(Constants.Cookie))) {
      if (Utils.isEmpty(this.msgList)) {
        this.MsgNoView()
      } else {
        this.MsgDataView()
      }
    } else {
      this.MsgNoLoginView()
    }
  }
}