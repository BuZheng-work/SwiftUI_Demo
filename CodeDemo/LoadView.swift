//
//  LoadView.swift
//  CodeDemo
//
//  Created by 籍孟飞 on 2019/7/13.
//  Copyright © 2019 isonmal. All rights reserved.
//

import SwiftUI

struct LoadView : View {
    
    @State var account = ""
    @State var pwass = ""
    @State var isAlter = false
    
    var finish: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            // StaticMember 设置各种控件style 暂时没有ButtonStyle 的样式只有空扩展
            TextField("输入你的账号", text: $account,onEditingChanged: accountEdit, onCommit: commit)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextField("输入你的密码", text: $pwass,onEditingChanged: pwassEdit, onCommit: commit)
                .textFieldStyle(.roundedBorder)
                .padding(.leading)
                .padding(.trailing)
            
            Button(action: verify(at: account, pwass: pwass)) {
                Image("loadbut")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                
            }
            .frame(width: UIScreen.main.bounds.size.width - 30, height: 49)
            Spacer()
        }
        .presentation($isAlter) {
            Alert(
                title: Text("错误"),
                message: Text("内容请填写完整"),
                dismissButton: Alert.Button.default(Text("确定"))
            )
        }
        
    }
    
    
    // 验证数据的一些操作
    func verify(at account: String, pwass: String) -> ()->Void {
        
        if account == "" || pwass == "" {
            return { self.isAlter = true }
        }
        
        return finish
    }
    
    //开始编辑和结束编辑时调用 如果多个输入框绑定同一个方法 没办法判断是那个输入框
    func accountEdit(at isEdit: Bool) {
        print("账号编辑==\(isEdit)")
    }
    func pwassEdit(at isEdit: Bool) {
        print("密码编辑==\(isEdit)")
    }
    
    // 回车键触发
    func commit() {
        print("......")
    }
}
