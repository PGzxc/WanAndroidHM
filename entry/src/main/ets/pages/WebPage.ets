/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import webview from '@ohos.web.webview';
import prompt from '@ohos.promptAction';
import Constants from '../common/constants/Constants';
import TitleBar from '../view/TitleBar';


@Entry
@Component
struct WebPage {
  webController: webview.WebviewController = new webview.WebviewController();
  @State params: object = router.getParams();
  @State progressVal: number = 0;
  @State isLoading: boolean = true;
  @State intervalLoading: number = -1;

  aboutToAppear() {
    this.intervalLoading = setInterval(() => {
      this.progressVal = this.progressVal >= Constants.WebConstant_PROGRESS_MAX ?
      Constants.WebConstant_PROGRESS_MIN : (this.progressVal + Constants.WebConstant_PROGRESS_STEP);
    }, Constants.WebConstant_MILLI_SECONDS);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Row() {
        Column() {
          TitleBar({ title: this.params['title'] })

          // Web component loading H5.
          Web({ src: this.params['path'], controller: this.webController })
            .zoomAccess(false)
            .width(Constants.FULL_PERCENT)
            .height(Constants.FULL_PERCENT)
            .onConfirm((event) => {
              return true;
            })
            .onErrorReceive((event) => {
              if (event?.error.getErrorInfo() === 'ERR_INTERNET_DISCONNECTED') {
                prompt.showToast({
                  message: $r('app.string.internet_err'),
                  duration: Constants.WebConstant_DURATION
                })
              }
              if (event?.error.getErrorInfo() === 'ERR_CONNECTION_TIMED_OUT') {
                prompt.showToast({
                  message: $r('app.string.internet_err'),
                  duration: Constants.WebConstant_DURATION
                })
              }
            })
            .onProgressChange((event) => {
              if (event?.newProgress === Constants.WebConstant_PROGRESS_MAX) {
                this.isLoading = false;
                clearInterval(this.intervalLoading);
                this.intervalLoading = -1;
              }
            })
        }
        .width(Constants.FULL_PERCENT)
        .height(Constants.FULL_PERCENT)
      }.width(Constants.FULL_PERCENT)
      .height(Constants.FULL_PERCENT)

      if (this.isLoading) {
        Progress({
          value: Constants.WebConstant_PROGRESS_MIN,
          total: Constants.WebConstant_PROGRESS_MAX,
          type: ProgressType.ScaleRing
        })
          .color(Color.Grey)
          .value(this.progressVal)
          .width(Constants.WebConstant_PROGRESS_WIDTH)
          .height(Constants.WebConstant_PROGRESS_WIDTH)
          .style({
            strokeWidth: Constants.WebConstant_PROGRESS_STROKE_WIDTH,
            scaleCount: Constants.WebConstant_PROGRESS_SCALE_COUNT,
            scaleWidth: Constants.WebConstant_PROGRESS_SCALE_WIDTH
          })
          .zIndex(1)
          .position({
            x: Constants.WebConstant_PROGRESS_POSITION_X,
            y: Constants.WebConstant_PROGRESS_POSITION_Y
          })
      }
    }
  }
}