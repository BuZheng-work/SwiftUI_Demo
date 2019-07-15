//
//  MenuView.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/12.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct MenuView : View {
    private let leftSpace: CGFloat = 20
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 20) {
            
            Group {
                
                
                
                
                NavigationCell(destination: WalletView(), title: "钱包", imageName: "IconCards")
                    .padding(.top,100)
                
                NavigationCell(destination: Text("主页"), title: "主页", imageName:
                    "IconHome")
                
                NavigationCell(destination: Text("设置"), title: "设置", imageName: "IconSettings")
            
            }
            .padding([.leading,.trailing])
            Spacer()
        }
        .background(Color.white)
        .foregroundColor(Color.black)
        .cornerRadius(20)
        .defultShadow()
        .padding(.trailing, 50)
        .padding(.bottom, 10)
    }

}

struct NavigationCell<V>: View where V: View {

    let destination: V
    let title: String
    let imageName: String
    
    var body: some View {
        
        NavigationLink(destination: destination) {
            
            ZStack {
                // 设置渐变色边框 LinearGradient 实现 shapeStyle  
                Rectangle()
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
                
                HStack {
                    Image(imageName)
                    Text(title)
                }
            }
            .frame(height: 44)
        }
    }
}

