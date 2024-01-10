import router from '@ohos.router';
@Entry
@Component
struct change {
  build() {
    Stack() {
      Row(){
        Image($r('app.media.bg6'))//设置背景图片
          .height('100%') //高度占页面40%
          .width('100%') //宽度占页面100%
      }
      Row(){
        Image($rawfile('img/ic_public_back.png'))
          .width('5.6%')
          .height('32%')
          .margin({left:5,top:-730})
          .onClick(()=>{
            router.back()
          })
        Text('返回')
          .width('82.2%')
          .height('50%')
          .fontSize(20)
          .fontColor('#000000')
          .margin({left:4,top:-730})
          .onClick(()=>{
            router.back()
          })
      }
      .height('8%')
      Button("抽奖")
        .backgroundColor(Color.Black)
        .margin({left:"-15%",bottom:"-15%"})
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/WebPage'
          })
        })
      Button("客服")
        .backgroundColor(Color.White)
        .fontColor(Color.Black)
        .margin({left:"30%",bottom:"8%"})
        .fontSize(30)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/ServicePage', //要跳转的路径
            //跳转时传递2个参数：path和tips
            params: { path: 'http://www.baidu.com', tips: $r('app.string.loadCloudH5') }
          })
        })
    }.height("100%")
    .width("100%")
  }
}
