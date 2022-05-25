//
//  ContentView.swift
//  FirstApp
//
//  Created by 林峻霆 on 2022/5/2.
//

import SwiftUI
// View is a protocol
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MovieList()
                .tabItem {
                    Label("MovieList", systemImage: "star")
                }
            MovieList()
                .tabItem {
                    Label("MovieList2", systemImage: "star")
                }
            MovieList()
                .tabItem {
                    Label("MovieList3", systemImage: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

