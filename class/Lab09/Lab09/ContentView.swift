//
//  ContentView.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var iphoneData = UserData()
    var body: some View {
        VStack{
            TabView {
                UserList(iphoneData: self.iphoneData)
                    .tabItem {
                        Text("List")
                        Image(systemName: "globe")
                }
                Chart(iphoneData: self.iphoneData)
                    .tabItem{
                    Image(systemName: "chart.pie")
                    Text("Chart")
                }
            }
            .accentColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
