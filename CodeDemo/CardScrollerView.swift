//
//  CardScrollerView.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/12.
//  Copyright © 2019 isonmal. All rights reserved.
//  首页横线滚动视图

import SwiftUI

struct CardScrollerView: View {
    
    var dataSources: [Vitem]
    var cardSize = CGSize(width: 246, height: 150)
    var edge = EdgeInsets(top: 10, leading: 50, bottom: 40, trailing: 40)
    var isAnimation = false
    var body: some View {
        
        //设置水平方向滚动的scroller
        ScrollView(.horizontal,showsIndicators: false) {
            // X轴方向布局 元素间距20
            HStack(spacing: 20) {
                //便利创建视图方法
                ForEach(dataSources) { item in
                    //设置内容大小为容器大小
                    GeometryReader { reader in
                       self.isAnimation ? CardView(item: item)
                        .rotation3DEffect(Angle(degrees: Double((reader.frame(in: .global).minX) - 40) / -20),
                                          axis: (x: 0, y: 10, z: 0))
                        : CardView(item: item)
                            .rotation3DEffect(Angle(degrees: 0),
                                              axis: (x: 0, y: 0, z: 0))
                    }
                    .frame(width: self.cardSize.width, height: self.cardSize.height)
                }
                
            }
            .padding(edge) // 设置内容的上下左右距离容器的间距
        }
    }
}
