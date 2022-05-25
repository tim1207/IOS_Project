//
//  ContentView.swift
//  AppClass0509
//
//  Created by 林峻霆 on 2022/5/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                NavigationLink {
                    RightPersonView()
                } label: {
                    Text("對的時間")
                }
                
                Image(systemName: "clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                
            }.navigationTitle("那個人是你ㄇ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
