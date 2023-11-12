import Constants from '../common/constants/Constants'
import router from '@ohos.router';
/**
 * @desc:启动页面
*
 */
@Entry
@Component
struct Splash {
  @State countdown: number = 2;
  private timer: number = -1;

  aboutToAppear(): void {
    setTimeout(() => {
      this.startTiming();
    }, 3000);
  }

  startTiming() {
    this.timer = setInterval(() => {
      this.countdown--;
      if (this.countdown === 0) {
        this.clearTiming();
        this.jumpToMainPage();
      }
    }, 1000);
  }

  clearTiming() {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  jumpToMainPage() {
    this.clearTiming();
    router.replaceUrl({
      url: 'pages/MainPage'
    });
  }

  aboutToDisappear() {
    this.clearTiming();
  }

  build() {
    Column() {
      Stack() {
        Image($r('app.media.splash_bg'))
          .width(Constants.FULL_PERCENT)
          .height(Constants.FULL_PERCENT)
        Image($r('app.media.ic_logo'))
          .width($r('app.float.192vp'))
          .height($r('app.float.192vp'))
          .offset({
            y: `-${Constants.PERCENTAGE_15}`
          })
          .objectFit(ImageFit.Contain)

        Column() {
          Text($r('app.string.app_name'))
            .fontColor(Color.White)
            .fontSize($r('app.float.font_size_24fp'))
            .fontWeight(FontWeight.Medium)

          // Text($r('app.string.app_name'))
          //   .fontSize($r('app.float.font_size_16fp'))
          //   .fontColor(Color.White)
          //   .margin({
          //     top: $r('app.float.5')
          //   })
        }
        .offset({
          y: Constants.PERCENTAGE_25
        })
      }
    }.height(Constants.FULL_SIZE)
    .width(Constants.FULL_SIZE)
  }
}