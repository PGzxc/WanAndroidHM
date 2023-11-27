import * as Utils from "../utils/Utils";
/**
 * 积分排行或个人积分——Item，三行或四行数据
 */
@Preview
@Component
export default struct InfoItem {
  param1: string = '';
  param2: string = '';
  param3: string = '';
  param4: string = '';

  build() {
    Column({ space: 5 }) {
      Text(this.param1)
      Text(this.param2)
      Text(this.param3)
      if (!Utils.isEmpty(this.param4)){
        Text(this.param4)
      }
    }.width('100%')
    .borderRadius(5)
    .padding({ left: 5, right: 5, top: 10, bottom: 10 })
    .backgroundColor($r('app.color.white_smoke'))
  }
}