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
* 如果容器为NavgationLink 有可能造成图片被渲染成蓝色 所以要添加图片的渲染模式为原色        
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
* SecureField 没有 onEditingChanged 方法的事件回调，placeholder 也无法显示

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
tabItem 为协议 View 的扩展方法所以任何实现View协议的视图都可以调用 tabItem

* 注意一定要设置tag 视图只会显示第一个 切换 tabItem 其他不显示


## List
列表视图
##### Selection == Never 时的构造方法

```
// data 参数为实现 Identifiable 协议的集合 
List(0..<10) { item in
                Text("\(item)")
            }
            // 列表视图的样式
            .listStyle(.grouped)
            
// 包含cell 点击事件的创建方式            
List(0..<10, action: { (item) in
                //TODO cell tap action
            }, rowContent: { item in
                Text("\(item)")
            })
            .listStyle(.plain)            
``` 
##### 加上selection 时构造方法
``` 
var demoData = ["oc", "ads", "wd", "dsa"]

struct SelectionDemo : View {
    @State var selectKeeper = SelectState()
    
    var body: some View {
        NavigationView {
            List(demoData.identified(by: \.self), selection: $selectKeeper){ name in
                Text(name)
            }
            .navigationBarTitle(Text("Selection Demo \(selectKeeper.keeper.count)"))
        }
    }
}

// 实现 SelectionManager 协议 
struct SelectState: SelectionManager {
    
    var keeper = Set<String>()
    
    mutating func select(_ value: String) {
        keeper.insert(value)
    }
    
    mutating func deselect(_ value: String) {
        keeper.remove(value)
    }
    
    func isSelected(_ value: String) -> Bool {
        return !self.keeper.contains(value)
    }
    
}            
```            
* SelectState 方法不会被调用不知道什么原因，也没有找到相关资料在这里记录下后续更改


``` 
List {
        // 设置区 可以设置区头区尾巴 
        Section(header: Text("区头"), footer: Text("尾巴")) {
            ForEach(data.identified(by: \.self)) { user in
                Text(user)
            }
            .onDelete { (indexSet) in
                //TODO
            }
            .onMove { (indexSet, destination) in
                //TODO
            }
            .onInsert(of: ["abc"]) { (destination, providers) in
                //TODO
            }
        }

    }

``` 
* onDelete, onMove, onInsert 为 DynamicViewContent 协议方法 只有遵循 DynamicViewContent 协议的才可以设置这几个方法 而 ForEach 这遵循了这个协议 暂时也只有这一个容器视图遵循了这个协议


## ScrollView
滚动视图

``` 
第一个参数 axes  滚动方向
第二个参数 是否显示滚动条
第三个参数 遵循View 协议的视图

ScrollView(.horizontal, showsIndicators: true) {
                    Text("SwiftIU")
          }
``` 
* 暂时没找到获取滚动事件的方法
 
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
* 给导航条添加标题，导航按钮 一定要在 NavigationView 容器内的子元素添加直接给 NavigationView 则不会显示
