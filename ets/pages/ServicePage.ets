import router from '@ohos.router';
import webview from '@ohos.web.webview';
@Entry
@Component
struct Itn {
  con:webview.WebviewController =new webview.WebviewController();
  build() {
    Column(){
      Row(){
        Image($rawfile('img/ic_public_back.png'))
          .width('5.6%')
          .height('32%')
          .margin({left:'7.2%'})
          .onClick(()=>{
            router.back()
          })
        Text('返回')
          .width('82.2%')
          .height('50%')
          .fontSize(20)
          .fontColor('#000000')
          .onClick(()=>{
            router.back()
          })
      }
      .height('8%')
      Web({src:router.getParams()?.['path'],controller:this.con})
    }
    .width('100%')
    .height('70%')
  }
}