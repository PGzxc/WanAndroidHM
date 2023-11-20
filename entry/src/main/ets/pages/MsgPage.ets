// 导入页面路由模块
import router from '@ohos.router';
import MsgReadList from '../view/MsgReadList';
import MsgUnreadList from '../view/MsgUnreadList';
import MsgViewModel from '../viewmodel/MsgViewModel';

/**
 * @desc:4-消息
 */
@Entry
@Component
export default struct MsgPage {
  private tabsController: TabsController = new TabsController()
  @State currentIndex: number = 0;

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        MsgUnreadList()
      }
      .tabBar('未读消息')

      TabContent() {
        MsgReadList()
      }
      .tabBar('已读消息')
    }.onChange((index) => {
      this.currentIndex = index
    })
  }
}