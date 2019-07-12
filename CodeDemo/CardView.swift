//
//  CardView.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/12.
//  Copyright © 2019 isonmal. All rights reserved.
//  首页卡片视图

import SwiftUI

struct CardView <Data>: View where Data: Item {
    var item: Data
    var body: some View {
        
        NavigationLink(destination: DetailView(item: item) ) {
            //Y轴方向的布局
            VStack(alignment: .leading) {
                
                Text(item.title)
                    .bold()
                    .lineLimit(2)
                    .foregroundColor(Color.white)
                    .fixedSize() //调整容器大小
                    .padding(10)
                
                Spacer()
                //设置图片
                Image(item.imageName)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                
                
            }
            .background(item.color) //设置背景色 Color 准守View 协议
            .cornerRadius(20)  //设置圆角
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10) //设置阴影
        }

    }
}

