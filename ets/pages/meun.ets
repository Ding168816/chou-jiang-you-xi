import router from '@ohos.router'; //导入router包
@Entry
@Component
struct meun {
  @State bg: Resource = $r('app.media.bg4');
  build() {
    Stack({alignContent:Alignment.TopStart}) {
      Image(this.bg)
        .height('100%') //高度占页面100%
        .width('100%') //宽度占页面100%
      Column({ space: 20 }) { //设置为上下结构布局
        //调用base/media/bg2图片,（默认铺满）。
        //点击按钮时跳转到WebPage页面
        Navigator({ target: 'pages/WebPage' }) {
          Button($r("app.string.loadLocalH5"))
            .width('40%') //宽度占页面37%
            .height(40) //高度40
            .fontSize(25) //文字大小25
            .backgroundColor(Color.Green)
        }
        //跳转时传递2个参数：path和tips
        .params({ path: $rawfile('index.html'), tips: $r('app.string.local') })
          .height('8%')
        //点击按钮跳转到ServicePage页面
        Button("联系客服")
          .width('40%') //宽度占页面37%
          .height(40) //高度40
          .fontSize(25) //文字大小25
          .backgroundColor(Color.Orange)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ServicePage', //要跳转的路径
              //跳转时传递2个参数：path和tips
              params: { path: 'http://www.baidu.com', tips: $r('app.string.loadCloudH5') }
            })
          })
        Button("切换背景")
          .width('40%') //宽度占页面37%
          .height(40) //高度40
          .fontSize(25) //文字大小25
          .backgroundColor(Color.Red)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/change'
            })
          })
      }
      .width('100%') //宽度占页面100%
      .height('100%') //高度占页面100%
      .justifyContent(FlexAlign.End)
      Row(){
        Image($rawfile('img/ic_public_back.png'))
          .width('5.6%')
          .height('32%')
          .margin({ left: '7.2%' })
          .onClick(() => {
            router.back()
          })
      }
      .height('8%')
    }
  }
}