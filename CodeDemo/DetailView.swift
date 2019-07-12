//
//  Detail.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/11.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct DetailView <Data>: View where Data: Item{
    var item: Data
    var body: some View {
        
        VStack {
            Image(item.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
        }
    
    }
}

