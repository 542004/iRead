
import {InfoMessage} from '../view/InfoMessage'

@Entry
@Component
struct Index {
  @State CurrentIndex:number=0
  private TabsController:TabsController=new TabsController()
  build() {
    Tabs({barPosition:BarPosition.End,controller:this.TabsController}){
      TabContent(){

      }.tabBar(this.TabBuilder($r('app.media.shujia'),$r('app.media.shujia_sel'),'书架',0))
      TabContent(){

      }.tabBar(this.TabBuilder($r('app.media.shucheng'),$r('app.media.shucheng_sel'),'书城',1))
      TabContent(){
        InfoMessage()
      }.tabBar(this.TabBuilder($r('app.media.geren'),$r('app.media.geren_sel'),'我的',2))
    }
  }

  @Builder
  TabBuilder(icon:Resource,icon_selected:Resource,text:string,index:number){
    Column(){
      Image(this.CurrentIndex==index?icon_selected:icon)
        .width('24vp')
        .height('24vp')
        .objectFit(ImageFit.Contain)
      Text(text)
        .fontSize("10vp")
        .fontWeight(500)
        .fontColor(this.CurrentIndex === index ? "#007DFF" : "#999")
        .margin({ top: "4vp" })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .onClick(()=>{
      this.CurrentIndex=index
      this.TabsController.changeIndex(this.CurrentIndex)
    })
    /**
     * 一旦使用了自定义导航栏，就需要使用TabsController来实现点击页签与页面内容的联动
     */
  }
}

