/**
 * @desc：文章Item
 */
import * as Utils from "../utils/Utils";
import { Article } from '../bean/ArticleBean'
import Constants from '../common/constants/Constants';
import { when } from '@ohos/hypium';

@Component
export default struct ArticleItem {
  article: Article = new Article()
  @State isTop: boolean = false;
  @State hasTag: boolean = false;
  @State tag: string = '';
  @State author: string | number = '';
  @State title: string = '';
  @State desc: string = '';
  @State hasPic: boolean = false;
  @State hasSuperChapterName: boolean = false;
  @State superChapterName: string = '';
  @State hasChapterName: boolean = false;
  @State chapterName: string = '';

  aboutToAppear() {
    let item = this.article

    this.isTop = item.isTop;
    this.hasTag = !Utils.isEmpty(item.tags);
    this.tag = !this.hasTag ? '暂无' : item.tags[0].name;
    this.author = Utils.isEmpty(item.author) ? Utils.isEmpty(item.shareUser) ? '' : item.shareUser : item.author;


    //this.author = Utils.isEmpty(item.author) ? Utils.isEmpty(item.shareUser) ? '' : item.shareUser : item.author;
    this.title = Utils.formatHtml(item.title);
    this.desc = Utils.formatHtml(item.desc)
    this.hasPic = !Utils.isEmpty(item.envelopePic)
    this.hasSuperChapterName = !Utils.isEmpty(item.superChapterName)
    this.superChapterName = Utils.isEmpty(item.superChapterName) ? '' : Utils.formatHtml(item.superChapterName)
    this.hasChapterName = !Utils.isEmpty(item.chapterName)
    this.chapterName = Utils.isEmpty(item.chapterName) ? '' : Utils.formatHtml(item.chapterName)

  }

  build() {
    Column() {
      //第一行
      Row() {

        //1-tag
        if (this.hasTag) {
          Text(this.tag)
            .height($r('app.float.23vp'))
            .fontSize($r('app.float.12fp'))
            .textAlign(TextAlign.Center)
            .borderRadius($r('app.float.3vp'))
            .fontColor($r('app.color.white'))
            .backgroundColor('red')
            .padding({
              left: $r('app.float.10vp'),
              right: $r('app.float.10vp'),
              top: $r('app.float.5vp'),
              bottom: $r('app.float.5vp')
            })
        }
        Row() {
          Image($r('app.media.ic_me_normal')).width($r('app.float.18vp')).height($r('app.float.18vp'))
          Text(this.author.toString()).margin({ left: $r('app.float.5vp') }) //2-author
        }.margin({ left: $r('app.float.5vp'), right: $r('app.float.5vp') })

        Row() {
          Image($r('app.media.ic_clock')).width($r('app.float.18vp')).height($r('app.float.18vp'))
          Text(this.article.niceDate) //3-time
        }
      }.width(Constants.FULL_PERCENT).justifyContent(FlexAlign.SpaceBetween)
      //第2行
      Flex({ direction: FlexDirection.Row }) {
        Column() {
          Text(this.title)
            //.width(Constants.FULL_PERCENT)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize($r('app.float.18fp'))
            .fontColor(Color.Black)
            .align(Alignment.TopStart)
          Text(this.desc)
            //.width(Constants.FULL_PERCENT)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontColor(Color.Gray)
            .align(Alignment.TopStart)
        }.flexGrow(1)
        //.width('70%')
        .alignItems(HorizontalAlign.Start)

        if (this.hasPic) {
          //Image('https://img1.baidu.com/it/u=2653588009,1450076812&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1699722000&t=b4f916a93f7e4735cf7c4c69416ab2fb')
          Image(this.article.envelopePic)
            .width($r('app.float.60vp'))
            .height('100%')
        }
      }.height($r('app.float.80vp')).margin({ top: $r('app.float.5vp') })
      //第3行
      Row() {
        //置顶
        if (this.isTop) {
          Text('置顶')
            .height($r('app.float.23vp'))
            .fontSize($r('app.float.12fp'))
            .borderRadius($r('app.float.3vp'))
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.white'))
            .backgroundColor($r('app.color.dark_orange'))
            .padding({
              left: $r('app.float.10vp'),
              right: $r('app.float.10vp'),
              top: $r('app.float.5vp'),
              bottom: $r('app.float.5vp')
            })
            .margin({ right: $r('app.float.10vp') })
        }

        if (this.hasSuperChapterName) {
          Text(this.superChapterName)
            .height($r('app.float.23vp'))
            .fontSize($r('app.float.12fp'))
            .borderRadius($r('app.float.3vp'))
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.white'))
            .backgroundColor($r('app.color.olive'))
            .padding({
              left: $r('app.float.10vp'),
              right: $r('app.float.10vp'),
              top: $r('app.float.5vp'),
              bottom: $r('app.float.5vp')
            })
            .margin({ right: $r('app.float.10vp') })
        }
        if (this.hasChapterName) {
          Text(this.chapterName)
            .height($r('app.float.23vp'))
            .fontSize($r('app.float.12fp'))
            .borderRadius($r('app.float.3vp'))
            .textAlign(TextAlign.Center)
            .fontColor($r('app.color.white'))
            .backgroundColor($r('app.color.teal'))
            .padding({
              left: $r('app.float.10vp'),
              right: $r('app.float.10vp'),
              top: $r('app.float.5vp'),
              bottom: $r('app.float.5vp')
            })
            .margin({ right: $r('app.float.10vp') })
        }
      }.width(Constants.FULL_PERCENT).justifyContent(FlexAlign.Start).margin({ top: $r('app.float.5vp') })

    }
    //.height(160)
    .width(Constants.FULL_PERCENT)
    .padding({
      top: $r('app.float.5vp'),
      bottom: $r('app.float.5vp'),
      left: $r('app.float.10vp'),
      right: $r('app.float.10vp')
    })
    .borderWidth(0.5)
    .borderColor(Color.Gray)
    .backgroundColor('#FFF1F3F5')
  }
}