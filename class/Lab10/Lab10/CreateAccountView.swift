//
//  CreateAccountView.swift
//  Lab10
//
//  Created by 林峻霆 on 2022/6/1.
//
import SwiftUI
import FirebaseAuth
struct CreateAccountView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""

    var body: some View {
        NavigationView{
            VStack{
                TextField("name", text: $name).padding(10)
                TextField("password", text: $password).padding(10)
                TextField("email address", text: $email).padding(10)
                Button("Create") {
                    Auth.auth().createUser(withEmail: email, password: password) { result, error in
                        guard let user = result?.user, error == nil else {
                            print(error?.localizedDescription)
                            dismiss()
                            return
                        }
                        let changeRequest = user.createProfileChangeRequest()
                        changeRequest.displayName = name
                        changeRequest.commitChanges { error in
                            guard error == nil else{
                                print(error?.localizedDescription)
                                dismiss()
                                return
                            }
                            
                        }
                    }
                    dismiss()
                }
            }.padding()
                .navigationTitle("註冊")
        }
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
