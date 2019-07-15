//
//  Detail.swift
//  CodeDemo
//
//  Created by isonmal on 2019/7/11.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct DetailView <Data>: View where Data: Item{
    var item: Data
    var body: some View {
        
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(0..<3) { index in
                        Image(self.item.imageName)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .background(Color.black)
                            .frame(width: SW, height: 250)
                            .padding(.trailing,10)
                    }
                }
            }
            
            Image(item.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
        
        }
    
    }
}

