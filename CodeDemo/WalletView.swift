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
        .frame(width: UIScreen.main.bounds.width - 30, height: 200)
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
        .tapAction(tap)
    }
    
    func tap() {
        print("===\(bank.name)")
        tapHundler(bank.name)
    }
    
}

struct Bank: Identifiable {
    let id = UUID()
    let name: String
    let shortName: String
    let bankNumber: String
    let colorName: String
}


let banks = [
            Bank(name: "中国银行", shortName: "BOC",bankNumber: "******9075",colorName: "background10"),
             Bank(name: "农业银行", shortName: "ABC",bankNumber: "******8082",colorName: "background6"),
             Bank(name: "招商银行", shortName: "CMB",bankNumber: "******8808",colorName: "background5"),
             Bank(name: "工商银行", shortName: "ICBC",bankNumber: "******0880",colorName: "background4"),
             Bank(name: "交通银行", shortName: "BOCOM",bankNumber: "******9527",colorName: "background3")]
