import router from '@ohos.router';
import webview from '@ohos.web.webview';

@Entry
@Component
struct WebPage {
  //创建WebController对象
  con:webview.WebviewController =new webview.WebviewController();

  build() {
    //层叠布局把页面分为2层：Image和Cloumn,Image在底层，Cloumn在上层
    Stack({alignContent:Alignment.TopStart}){
      Image($r('app.media.bg5'))
        .height('100%')
        .width('100%')
      //Cloumn里分为3部分，从上往下依次为：Row、Web、Button
      Column(){
        //用于标题返回，由2部分构成，从左往右依次为Image和Text
        Row(){
            Image($rawfile('img/ic_public_back.png'))
              .width('5.6%')
              .height('32%')
              .margin({left:'7.2%'})
              .onClick(()=>{
                router.back()
              })

            Text($r('app.string.prompts'))
              .width('82.2%')
              .height('50%')
              .fontSize(20)
              .fontColor($r('app.color.black'))
              .margin({left:'5%'})

        }
        .height('8%')

        //用于加载网页
        Web({src:$rawfile('index.html'),controller:this.con})
          .width('93.3%')
          .height('90%')
          .zoomAccess(false)
          .margin({left:'3.3%',right:'3.3%',top:'7.1%'})
          .aspectRatio(1)
          .onConfirm((event)=>{
            //调用弹窗
              AlertDialog.show({
                //弹窗主体信息,这个必须要。
                message: `${'您抽中了：'}` + `${event.message}`,
                //调用弹窗确认按钮
                confirm: {
                  value: $r('app.string.web_alert_dialog_button_value'),  //确认按钮文字
                  action: () => {                                         //点击确认按钮要执行的代码
                    event.result.handleConfirm();                         //处理JavaScript结果
                  }
                },
                //退出弹窗时要执行的代码
                cancel: () => {
                  event.result.handleCancel();                          //处理JavaScript结果
                }
              })

            return false
          })

        //用于点击按钮抽奖
        Button($r('app.string.btnValue'))
          .width('86.7%')
          .height('5.1%')
          .fontSize(20)
          .fontColor($r('app.color.start_window_background'))
          .margin({top:'10%'})
          .borderRadius(20)
          .onClick(()=>{
            //调用网页里js的startDraw方法
            this.con.runJavaScript('startDraw()')

          })
      }
      .width('100%')
      .height('100%')
    }
    .backgroundColor($r('app.color.navy_blue'))
    .width('100%')
    .height('100%')
  }
}