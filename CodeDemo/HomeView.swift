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
    @State var isModel = false
    
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
                
                // 添加顶部工具条
                ToolBarView(menuAction: openMenu, userAction: openUser, mesageAction: openMessage)
                
                // 添加菜单视图
                Button(action: openMenu) { MenuView() }
                .offset(x: isMenu ? 0 : -SW)
                .animation(.basic(duration: 0.25, curve: .easeInOut))
                
            }
            .background(Color("background"))
            .navigationBarTitle("Coder", displayMode: .inline) //设置导航文字和 样式
        }
        .presentation(
            isModel ? Modal(LoadView(finish: openUser)) { self.isModel.toggle() } : nil
        )
        
    }
    
    // 打开菜单按钮
    func openMenu() { withAnimation { isMenu.toggle() } }
    //打开load
    func openUser() { isModel.toggle() }
    
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
                .frame(width: SW - 40,alignment: .leading)
                .padding(.leading, 50)
//                .baselineOffset(60) 设置Text向上向下 +向上 -向下
        
    }
}

