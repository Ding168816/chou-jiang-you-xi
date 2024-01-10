import router from '@ohos.router';
@Entry
@Component
struct Wjmm {
  build() {
    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.bg2'))
        .width('100%')
        .height('100%')
      Column({ space: 20 }) {
        TextInput({ placeholder: "请输入你的手机号码" }).backgroundColor(Color.White)
          .width('65%')
          Button('发送验证码')
            .onClick(()=>{
              AlertDialog.show({
                message: '游戏验证码：123' +' '+
                '用于账号：18593310620 登录',
                primaryButton:{
                  value:'确定',
                  action:()=>{
                  }
                },
                secondaryButton:{
                  value:'完成验证',
                  action:()=>{
                    router.pushUrl({url:'pages/meun'});
                  }
                },
                cancel:()=>{
                }
              })
            })
            .width('65%')
            .backgroundColor(Color.White)
            .fontColor(Color.Blue)
      }
      .width('100%')
      .height('60%')
      .justifyContent(FlexAlign.Center)
      Row() {
        Image($rawfile('img/ic_public_back.png'))
          .width('5.6%')
          .height('32%')
          .margin({ left: '7.2%' })
          .onClick(() => {
            router.back()
          })
        Text('返回')
          .width('82.2%')
          .height('50%')
          .fontSize(20)
          .fontColor('#000000')
          .onClick(() => {
            router.back()
          })
      }
      .height('15%')
    }
  }
}