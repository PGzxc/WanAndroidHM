// 导入页面路由模块
import Constants from '../common/constants/Constants';
import MineFunc from '../view/MineFunc';
import MineHead from '../view/MineHead';

/**
 * @desc:5-我的
 */

@Entry
@Component
export default struct MePage {
  build() {
    Scroll() {
      Column() {
        MineHead() //我的-头部信息
        MineFunc() //我的-功能
      }
      .height(Constants.FULL_PERCENT)
    }
  }
}