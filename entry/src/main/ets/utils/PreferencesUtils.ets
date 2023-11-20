import preferences from '@ohos.data.preferences';
import dataPreferences from '@ohos.data.preferences';
import Logger from './Logger';

const PREFERENCES_NAME = 'theme.db'
let preferenceTheme: preferences.Preferences = null
const TAG: string = '[Index]'

class PreferencesUtils {
  constructor() {
    this.createDataPreferences()
  }

  async createDataPreferences() {
    preferenceTheme = await dataPreferences.getPreferences(globalThis.abilityContext, PREFERENCES_NAME);
  }


  /**
   * 保存String数据
   * @param str
   */
  async putStringData(key: string, value: string) {
    Logger.info(TAG, `Put begin`)
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, value)
      await preferenceTheme.flush()
    }
  }

  /**
   * @returns
   */
  async getStringData(key: string) {
    Logger.info(TAG, `Get begin`)
    if (preferences !== null) {
      let data: string = ''
      data = <string> await preferenceTheme.get(key, '')
      return data;
    }
  }

  async putNumberData(key: string, num: number) {
    Logger.info(TAG, `Put begin`)
    if (preferenceTheme !== null) {
      await preferenceTheme.put(key, num)
      await preferenceTheme.flush()
    }
  }

  /**
   * getNumber数据
   * @returns
   */
  async getNumberData(key: string) {
    Logger.info(TAG, `Get begin`)
    if (preferences !== null) {
      let data: number = 0;
      data = <number> await preferenceTheme.get(key, -1)
      return data;
    }
  }
}

let preferencesUtil = new PreferencesUtils();

export default preferencesUtil as PreferencesUtils;