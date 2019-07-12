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
            
            NavigationLink(destination: WalletView()) {
                HStack {
                    Image("IconCards")
                    Text("钱包")
                    Spacer()
                }
            }
            .padding(.top,100)
            .padding(.leading,leftSpace)
            
            NavigationLink(destination: Text("abc")) {
                HStack {
                    Image("IconHome")
                    Text("主页")
                    Spacer()
                }
            }
            .padding(.leading,leftSpace)
            
            NavigationLink(destination: Text("abc")) {
                HStack {
                    Image("IconSettings")
                    Text("设置")
                    Spacer()
                }
            }
            .padding(.leading,leftSpace)
            Spacer()
        }
        .background(Color.white)
        .foregroundColor(Color.black)
        .cornerRadius(20)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
        .padding(.trailing, 50)
        .padding(.bottom, 10)
        
    }
    
    func action() {
        
    }
}
