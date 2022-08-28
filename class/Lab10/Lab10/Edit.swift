//
//  Edit.swift
//  Lab10
//
//  Created by 林峻霆 on 2022/6/1.
//

import SwiftUI
import FirebaseAuth
struct Edit: View {
    @Environment(\.dismiss) private var dismiss
    @State var name = ""
    var body: some View {
        VStack{
            TextField("name", text:$name)
                .padding()
            Button("送出"){
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges(completion: { error in
                    guard error == nil else{
                        print(error?.localizedDescription)
                        dismiss()
                        return
                    }
                })
                dismiss()
            }
        }
    }
}

struct Edit_Previews: PreviewProvider {
    static var previews: some View {
        Edit()
    }
}
