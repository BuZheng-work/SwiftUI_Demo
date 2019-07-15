# SwiftUI_Demo
swiftUI 练习项目记录一些基本视图的使用和坑

## Text
文本视图

```
 Text("SwiftUI")
                .lineLimit(2)//行数 可以为 .none
                .kerning(2) //字符间距
                .underline(true) //下划线
                .font(.title)
                .foregroundColor(Color.red)
      
```
 
 
## Image
image视图

```
Image("background")
                 //设置大小前必须调用此方法 不然无效
                .resizable()
                //渲染模式 想让图片显示原有颜色可以使用此方法
                .renderingMode(.original)               
                .frame(height: 200)
                //填充模式 fill 平铺 fit 图片比例不变
                .aspectRatio(contentMode: .fit)
```        
*如果容器为NavgationLink 有可能造成图片被渲染成蓝色 所以要添加图片的渲染模式为原色        
## Button
按钮视图
 
``` 
// 只有文字的按钮
Button(action: {//TODO}) {
           Text("Hello World!")
         } 
  
 
// 图片+文字的按钮 图片在文字上方
Button(action: {//TODO}) {
           Image("photo")
           Text("Hello World!")
        } 
 // 图片+文字的按钮 图片在文字左边      
 Button(action: {//TODO}) {
	        HStack {
	            Image("photo")
	            Text("Hello World!")
	        }
       }
```
## TextField
输入框视图

```
TextField("输入你的手机号", text $account,onEditingChanged: { isEdit in 
   //TODO 开始编辑 和 结束编辑时调用
 }, 
 onCommit: {
 // TODO 回车键调用 
 })
   .textFieldStyle(.roundedBorder) // 输入框样式
   .textContentType(.creditCardNumber) //设置键盘样式
   .padding()
   
   //密文样式的输入框
   SecureField("输入你的密码", text: $pwass) {
     //TODO 回车键调用
   }
   .textFieldStyle(.roundedBorder)
   .textContentType(.password)
   .padding()
           

```
* TextField 无法获取编辑中的状态，如果多个视图同时绑定同一个 onEditingChanged 方法回调这没有办法区分是那个视图事件

 ## TabbedView
类似UIKit中的UITarbarView/UITabarViewController 

```
TabbedView {
                Home()
                    .tag(0)
                    .tabItem {
                      Image(systemName: "square.and.pencil")
                      Text("首页")
                }
                User()
                    .tag(1)
                    .tabItem {
                    Image(systemName: "clock.fill")
                    Text("个人")
                }
                
                Order()
                    .tag(2)
                    .tabItem {
                    Image(systemName: "square")
                    Text("随便")
                }
         }
```
tabItem 为协议 View 的扩展方法 所以 任何实现 View 协议的视图都可以调用 tabItem

 *注意一定要设置tag 视图只会显示第一个 切换 tabItem 其他不显示
 
## NavigationView
导航容器为容器添加导航条

 ```
 NavigationView {
           Text("helloWord").navigationBarTitle("Demo")
        }
 
 ```
 navigationBarTitle 同样为协议View的扩展方法  如要设置导航样式
 
 ``` 
 NavigationView {
            Text("Hello World!").navigationBarTitle(Text("Demo"), displayMode: .inline)
        }
 
 ```
 *给导航条添加标题，导航按钮 一定要在 NavigationView 容器内的 子元素添加 直接给 NavigationView 则不会显示
