//
//  LoginView.swift
//  Lab10
//
//  Created by 林峻霆 on 2022/6/1.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var email: String = ""
    var body: some View {
        NavigationView{
            VStack{

                TextField("email address", text: $email).padding(10)
                TextField("password", text: $password).padding(10)
               
                Button("Login") {
                    Auth.auth().signIn(withEmail: email, password: password) { result, error in
                         guard error == nil else {
                            print(error?.localizedDescription)
                             dismiss()
                            return
                         }
                        dismiss()
                    }
                }
            }.padding()
                .navigationTitle("登入")
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
