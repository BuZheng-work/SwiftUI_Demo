//
//  ContentView.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/11.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    
    @State var isMenu = false
    
    var body: some View {
        
        //设置导航
        NavigationView {
            
            ZStack(alignment: .top) {
                // 滚动视图
                ScrollView(.vertical,showsIndicators: false) {
                    // 设置区
                    Section(header: HeaderView(title: "资源")) {
                        CardScrollerView(dataSources: sources, cardSize: CGSize(width: 218, height: 300),isAnimation: true)
                    }
                    .padding(.top, 20)
                    // 设置带区头的区域
                    Section(header: HeaderView(title: "编码课程")) {
                        CardScrollerView(dataSources: sources1)
                    }
                }
                
                ToolBarView(menuAction: openMenu, userAction: openUser, mesageAction: openMessage)
                
                Button(action: openMenu) {
                    MenuView()
                }
                .offset(x: isMenu ? 0 : -UIScreen.main.bounds.width)
                .rotation3DEffect(Angle(degrees: isMenu ? 0 : 30), axis: (x: 0, y: 10, z: 0))
                .animation(.basic(duration: 0.25, curve: .easeInOut))
                
                
            }
            .background(Color("background"))
            .navigationBarTitle("练习Demo", displayMode: .inline) //设置导航文字和 样式
        }
        
    }
    
    // 打开菜单按钮
    func openMenu() {
        print("打开菜单按钮")
        withAnimation { isMenu.toggle() }
    }
    func openUser() {
        print("点击了")
    }
    func openMessage() {
        print("点击了")
    }
    
}


protocol Item: Identifiable {
    var title: String {get}
    var imageName: String {get}
    var color: Color {get}
}


struct Vitem: Item {
    let id = UUID()
    let title: String
    let imageName: String
    let color: Color
}



struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        
            Text(title)
                .bold()
                .frame(width: UIScreen.main.bounds.size.width - 40,alignment: .leading)
                .padding(.leading, 50)
//                .baselineOffset(60) 设置Text向上向下 +向上 -向下
        
    }
}

let sources = [
    Vitem(title: "SwiftUI", imageName: "item1", color: Color("gradient1")),
    Vitem(title: "UIKit", imageName: "item2", color: Color("background10")),
    Vitem(title: "Swift", imageName: "item3", color: Color("background5")),
    Vitem(title: "Sketch", imageName: "item4", color: Color("background6"))]

let sources1 = [Vitem(title: "Java从入门到放弃", imageName: "item6", color: .black),
                Vitem(title: "程序员的自我修养", imageName: "item7", color: .black),
                Vitem(title: "Ios从入门到放弃", imageName: "item8", color: .black),
                Vitem(title: "不写代码之后能干些什么", imageName: "item9", color: .black)]
