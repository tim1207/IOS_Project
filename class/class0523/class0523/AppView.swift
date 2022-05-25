//
//  AppView.swift
//  class0523
//
//  Created by 林峻霆 on 2022/5/23.
//

import SwiftUI

struct AppView: View {
    @StateObject private var cat = Cat()
    var body: some View {
        TabView {
            FirstTab()
                .tabItem { Text("first") }
            SecondTab()
                .tabItem { Text("second") }
        }
        .environmentObject(cat)
    }
    
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
