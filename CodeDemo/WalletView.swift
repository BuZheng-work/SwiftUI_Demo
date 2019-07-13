//
//  wallet View.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/12.
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
                    .padding(.top,CGFloat(index) * 64)
                    .offset(y: self.thisCard  == .none ? 0 : self.thisCard == banks[index].name ?  -CGFloat(index) * 64 : 300
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

struct BankCardView: View {
    let bank: Bank
    let tapHundler: (String)->Void
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                Image(bank.shortName)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .padding(.top, 15)
                    .padding(.leading, 15)
                
                VStack(alignment: .leading) {
                    Text(bank.name)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("信用卡")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
            }
            
            HStack {
                Text(bank.bankNumber)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                Image("YL")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64)
                    .padding()
            }
        }
        .background(Color(bank.colorName))
        .frame(width: SW - 30, height: 200)
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
        .tapAction {self.tapHundler(self.bank.name)}
    }
    
}

struct Bank: Identifiable {
    let id = UUID()
    let name: String
    let shortName: String
    let bankNumber: String
    let colorName: String
}



