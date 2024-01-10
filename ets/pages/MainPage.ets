import router from '@ohos.router';
@Entry
@Component
struct MainPage {
  @State Id:string = '001'
  @State Password: string = '123'//判断用户输入的密码是否正确
  @State show: string = ''//用于接收文本信息
  user_password: string;
  user_id: string;
  build() {
    Stack({alignContent:Alignment.TopStart}) {
        Image($r('app.media.bg3'))//设置背景图片
          .height('100%') //高度占页面40%
          .width('100%') //宽度占页面100%
      Column({ space: 20 }) {
        TextInput({ placeholder: "请输入你的账号" }).backgroundColor(Color.White)
          .width('65%')
          .onChange((text: string) => {
            this.user_id = text
          })
        TextInput({ placeholder: "请输入你的密码" }).backgroundColor(Color.White)
          .width('65%')
          .onChange((text: string) => {
            this.user_password = text
          })
        Button('登录').backgroundColor(Color.Blue)
          .width('65%')
          .onClick(() => {
            if (this.Password == this.user_password &&this.Id == this.user_id) {
              router.pushUrl({
                url: 'pages/meun'
              })
            }
            else {
              AlertDialog.show({
                title:'             登录失败',
                message:'账号或密码错误',       //弹窗主体信息
                primaryButton:{
                  value:'确定',
                  action:()=>{
                  }
                },
                secondaryButton:{
                  value:'找回密码',
                  action:()=>{
                    router.pushUrl({url:'pages/help'});
                  }
                },
                cancel:()=>{
                }
              })
            }
          })
        Button('快速游戏').backgroundColor(Color.Blue)
          .width('65%')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/WebPage'
            })
          })
        Text(this.show)
          .fontSize(30)
          .fontColor(Color.Red)
      }
      .width('100%') //宽度占页面100%
      .height('100%') //高度占页面100%
      .justifyContent(FlexAlign.End)
    }
  }
}

