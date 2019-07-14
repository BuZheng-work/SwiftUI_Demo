//
//  Sources.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/13.
//  Copyright © 2019 isonmal. All rights reserved.
//

import Foundation
import SwiftUI

let sources = [
    Vitem(title: "SwiftUI", imageName: "item1", color: Color("gradient1")),
    Vitem(title: "UIKit", imageName: "item2", color: Color("background10")),
    Vitem(title: "Swift", imageName: "item3", color: Color("background5")),
    Vitem(title: "Sketch", imageName: "item4", color: Color("background6"))]

let sources1 = [Vitem(title: "Java从入门到放弃", imageName: "item6", color: .black),
                Vitem(title: "程序员的自我修养", imageName: "item7", color: .black),
                Vitem(title: "Ios从入门到放弃", imageName: "item8", color: .black),
                Vitem(title: "不写代码之后能干些什么", imageName: "item9", color: .black)]


let banks = [
    Bank(name: "中国银行", shortName: "BOC",bankNumber: "******9075",colorName: "background10"),
    Bank(name: "农业银行", shortName: "ABC",bankNumber: "******8082",colorName: "background6"),
    Bank(name: "招商银行", shortName: "CMB",bankNumber: "******8808",colorName: "background5"),
    Bank(name: "工商银行", shortName: "ICBC",bankNumber: "******0880",colorName: "background4"),
    Bank(name: "交通银行", shortName: "BOCOM",bankNumber: "******9527",colorName: "background3")]

let SW = UIScreen.main.bounds.width
let SH = UIScreen.main.bounds.height

extension View {
    
    func defultShadow() -> Self.Modified<_ShadowEffect> {
        return shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 5, x: 0, y: 10)
    }
}
