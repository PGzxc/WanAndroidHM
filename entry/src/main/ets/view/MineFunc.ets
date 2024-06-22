/**
 * @desc：我的-常用功能
 */
import Constants from '../common/constants/Constants';

interface FuncInterface {
  'name': string;
  'backgroundColor': Color;
}

@Preview
@Component
export default struct MineFunc {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
    gridData:FuncInterface[]= [
    {
      name: "工具",
      backgroundColor: Color.Red
    },
    {
      name: "问答",
      backgroundColor: Color.Orange
    },
    {
      name: "消息",
      backgroundColor: Color.Yellow
    },
    {
      name: "课程",
      backgroundColor: Color.Green
    },
    {
      name: "待办清单",
      backgroundColor: Color.Pink
    },
    {
      name: "分享文章",
      backgroundColor: Color.Grey
    },
  ]
  @State currentBp: string = 'unknown';

  build() {
    Column() {
      Text('常用功能')
        .fontSize($r('app.float.20fp'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: $r('app.float.10vp') })

      GridRow({ columns: 3 }) {
        ForEach(this.gridData, (item:FuncInterface, index) => {
          GridCol() {
            Row() {
              Text(`${item.name}`).textAlign(TextAlign.Center).width('100%')
            }.width('100%').height(120)
          }.backgroundColor(item.backgroundColor)
        })
      }
      .width('100%').height('100%')
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }
    .height(600)
    .alignItems(HorizontalAlign.Start)
    .padding({ left: $r('app.float.10vp'), right: $r('app.float.10vp') })
    .width(Constants.FULL_PERCENT)
  }
}