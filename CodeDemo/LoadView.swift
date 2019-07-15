//
//  LoadView.swift
//  CodeDemo
//
//  Created by isonmal on 2019/7/13.
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
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 150)
                .padding()
            
            // StaticMember 设置各种控件style 暂时没有ButtonStyle 的样式只有空扩展
            TextField("输入你的手机号", text: $account,onEditingChanged: accountEdit, onCommit: commit)
                .textFieldStyle(.roundedBorder)
                .textContentType(.creditCardNumber) //设置键盘样式
                .padding()
            // placeholder 显示不出来。。。
            SecureField("输入你的密码", text: $pwass, onCommit: commit)
                .textFieldStyle(.roundedBorder)
                .textContentType(.password)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 40)
            
            Button(action: verify(at: account, pwass: pwass)) {
                Image("loadbut")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                
            }
            .frame(width: SW - 30, height: 49)
            Spacer()
        }.tapAction {
            UIApplication.shared.keyWindow?.endEditing(true)
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

