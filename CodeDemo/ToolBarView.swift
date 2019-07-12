//
//  ToolBarView.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/12.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct ToolBarView: View {
    
    let menuAction: () -> Void
    let userAction: () -> Void
    let mesageAction: () -> Void
    
    var body: some View {
        
        //设置顶部菜单条
        HStack(alignment: .top, spacing: 10) {
            
            // 设置菜单按钮
            Button(action: menuAction) {
                Image("Menu")
                    .foregroundColor(Color.black)
                    .padding()
            }
            .frame(width: 80, height: 40, alignment: .trailing)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.leading, -40)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
        
            Spacer()
            
            // 设置菜单按钮
            Button(action: userAction) {
                Image("user")
                    .foregroundColor(Color.black)
            }
            .frame(width: 40, height: 40)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
            
            // 设置菜单按钮
            Button(action: mesageAction) {
                Image("message")
                .foregroundColor(Color.black)
            }
            .frame(width: 40, height: 40)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
            .padding(.trailing, 10)
            
        }
        .padding(.top, 10)
        
    }
}
