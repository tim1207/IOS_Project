//
//  List.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//


import SwiftUI

struct UserList: View {
    @ObservedObject var iphoneData = UserData()
    @State private var show = false
    @State private var searchText = ""
    
    var filterWords: [User] {
        return iphoneData.users.filter({searchText.isEmpty ? true : $0.Device.contains(searchText)})
       }
    var body: some View {
        NavigationView {
            List {
                Search(text: $searchText)
                ForEach(filterWords){ (user) in
                    NavigationLink(destination: UserEditor(iphonesData: self.iphoneData, editUser: user)) {
                        UserRow(user: user)
                    }
                }
                .onMove { (indexSet, index) in
                    self.iphoneData.users.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete{ (index) in
                    self.iphoneData.users.remove(atOffsets: index)
                }
            }
            .navigationBarTitle("User List")
            .navigationBarItems(leading: EditButton().accentColor(.green), trailing: Button(action: {
                    self.show = true
                },label: {
                    Image(systemName: "plus.circle.fill")
                    }))
            .sheet(isPresented: $show){
                NavigationView {
                    UserEditor(iphonesData: self.iphoneData)
                }
            }
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
