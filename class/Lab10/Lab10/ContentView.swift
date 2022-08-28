//
//  ContentView.swift
//  Lab10
//
//  Created by 林峻霆 on 2022/6/1.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
   
    @Environment(\.presentationMode) var presentationMode
    @State var registerView = false
    @State var loginView = false
    @State var edit = false
    var body: some View {
        
        if let user = Auth.auth().currentUser {
            Text("email:\(user.email ?? "error")").padding(10)
            Text("你好, \(user.displayName ?? "error")")
                .padding(10)
            Button("登出"){
                do{
                    try Auth.auth().signOut()
                }
                catch{
                    
                }
            }.padding(10)
            Button("編輯使用者名字"){
                edit = true
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding(10)
            .sheet(isPresented: $edit) {
               Edit()
            }
        } else {
            VStack{
                Button("註冊"){
                    registerView = true
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding(10)
                .sheet(isPresented: $registerView){
                    CreateAccountView()
                }
                .padding(10)
                Button("登入"){
                    loginView = true
                    self.presentationMode.wrappedValue.dismiss()
 
                }
                .padding(10)
                .sheet(isPresented: $loginView){
                    LoginView()
                }
                
            }
        }
            
         
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
