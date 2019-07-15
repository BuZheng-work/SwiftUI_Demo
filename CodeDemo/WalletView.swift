//
//  wallet View.swift
//  CodeDemo
//
//  Created by isonmal on 2019/7/12.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct WalletView: View {
    
    @State var thisCard: String?
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .top) {
                ForEach(0..<banks.count) { index in
                    BankCardView(bank: banks[index]) { self.thisCard = $0 }
                    .frame(width: SW - 30, height: 200)
                    .padding(.top,CGFloat(index) * 64)
                    .offset(y: self.thisCard  == .none ? 0 : self.thisCard == banks[index].name ?  -CGFloat(index) * 64 : 320
                    )
                    .animation(.spring())
                }
            }
            .padding(.top, 10)
            Spacer()
        }
        .navigationBarTitle("钱包")
    }

}



struct Bank: Identifiable {
    let id = UUID()
    let name: String
    let shortName: String
    let bankNumber: String
    let colorName: String
}



