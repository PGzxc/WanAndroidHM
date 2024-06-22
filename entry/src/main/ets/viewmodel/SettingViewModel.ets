/**
 * @desc:7-Setting-数据逻辑类
 */
import router from '@ohos.router';
import { logoutReq } from '../api/HttpRequest';
import SettingItem from '../bean/SettingItem';
import Constants from '../common/constants/Constants';

class SettingViewModel {
  logout() {
    logoutReq().then(result => {
      //清除cookie等数据
      if (AppStorage.Has(Constants.Cookie)) {
        AppStorage.Set(Constants.Cookie, '')
        PersistentStorage.DeleteProp(Constants.Cookie)
        //AppStorage.Clear()
        //router.back()
        router.replaceUrl({ url: Constants.MainPage_Path });
      }
    })
  }

  /**
   * @desc:设置Items数据
  * @returns
   */
  getSettingListData(): Array<SettingItem> {
    let settingListData: SettingItem[] = [
      new SettingItem($r('app.string.setting_list_theme'), $r('app.media.ic_theme'), $r(null)),
      new SettingItem($r('app.string.setting_list_language'), $r('app.media.ic_language'), $r(null)),
      new SettingItem($r('app.string.setting_list_about'), $r('app.media.ic_about'), $r(null)),
    ];
    return settingListData;
  }
}

let settingViewModel = new SettingViewModel();

export default settingViewModel as SettingViewModel;