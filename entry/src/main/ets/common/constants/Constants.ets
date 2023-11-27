/**
 * @desc：定义常量
 */
import SettingItem from '../../bean/SettingItem';

export default class Constants {

  /**
   * route path
   */
  static readonly Splash_Path: string = 'pages/Splash';
  static readonly MainPage_Path: string = 'pages/MainPage';
  static readonly LoginRegister_Path: string = 'pages/LoginRegisterPage';
  static readonly WebPage_Path: string = 'pages/WebPage';
  static readonly SettingPage_Path: string = 'pages/SettingPage';
  static readonly TreeTabPage_Path: string = 'pages/TreeTabPage';
  static readonly InfoPage_Path: string = 'pages/InfoPage';


  /**
   * Component size.
   */
  static readonly ICON_SIZE: string = '40%';
  static readonly FULL_PERCENT: string = '100%';
  static readonly BAR_HEIGHT: string = '10%';
  static readonly FULL_SIZE: string = '100%';


  /**
   * Component location.
   */
  static readonly PERCENTAGE_15: string = '15%';
  static readonly PERCENTAGE_25: string = '25%';
  /**
   * Component constants.
   */
  static readonly OPACITY: number = 0.6;
  static readonly BORDER_WIDTH: number = 0.5;

  /**
   * BottomTabIndex
   */
  static readonly HOME_TAB_INDEX = 0;
  static readonly NAV_TAB_INDEX = 1;
  static readonly PROJECT_TAB_INDEX = 2;
  static readonly MSG_TAB_INDEX = 3;
  static readonly MINE_TAB_INDEX = 4;


  /**
   * WebView
   */
  static readonly WebConstant_PROGRESS_MAX: number = 100;
  static readonly WebConstant_PROGRESS_MIN: number = 0;
  static readonly WebConstant_PROGRESS_STEP: number = 10;
  static readonly WebConstant_MILLI_SECONDS: number = 100;
  static readonly WebConstant_DURATION: number = 3000;
  static readonly WebConstant_PROGRESS_WIDTH: number = 80;
  static readonly WebConstant_PROGRESS_STROKE_WIDTH: number = 15;
  static readonly WebConstant_PROGRESS_SCALE_COUNT: number = 15;
  static readonly WebConstant_PROGRESS_SCALE_WIDTH: number = 5;
  static readonly WebConstant_PROGRESS_POSITION_X: string = '40%';
  static readonly WebConstant_PROGRESS_POSITION_Y: string = '40%';
  /**
   * The width or height of the component is spread across the parent component.
   */
  static readonly FULL_PARENT = '100%';

  /**
   * Shared transition duration.
   */
  static readonly SHARED_DURATION: number = 800;
  /**
   * Page transition exit delay.
   */
  static readonly EXIT_DELAY: number = 100;
  /**
   * Type font weight.
   */
  static readonly TYPE_FONT_WEIGHT: number = 700;
  /**
   * Desc font weight.
   */
  static readonly DESC_FONT_WEIGHT: number = 400;
  /**
   *  Left padding of the input box
   */
  static readonly INPUT_PADDING_LEFT = 0;
  /**
   * Delay time of simulated login
   */
  static readonly LOGIN_DELAY_TIME = 2000;
  /**
   * Input length of the account.
   */
  static readonly INPUT_ACCOUNT_LENGTH = 16;
  /**
   *  Input length of the password.
   */
  static readonly INPUT_PASSWORD_LENGTH = 16;
  /**
   * The width of button
   */
  static readonly BUTTON_WIDTH = '90%';
  static readonly SET_LIST_WIDTH = '42%';

  /**
   * 常量
   */
  static readonly RANK = 'rank';
  static readonly COLLECT = 'collect';
  static readonly LEVEL = 'level';
  static readonly COIN = 'coin';

  /**
   * Preference-key
   */
  static readonly Cookie: string = 'cookie';
  static readonly settingListData: SettingItem[] = [
    new SettingItem($r('app.string.setting_list_theme'), $r('app.media.ic_theme'), null),
    new SettingItem($r('app.string.setting_list_language'), $r('app.media.ic_language'), null),
    new SettingItem($r('app.string.setting_list_about'), $r('app.media.ic_about'), null),
  ];
}