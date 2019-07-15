//
//  BankCardView.swift
//  CodeDemo
//
//  Created by isonmal on 2019/7/15.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

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
            .cornerRadius(10)
            .defultShadow()
            .tapAction {self.tapHundler(self.bank.name)}
    }
    
}
