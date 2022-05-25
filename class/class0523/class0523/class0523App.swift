//
//  class0523App.swift
//  class0523
//
//  Created by 林峻霆 on 2022/5/23.
//

import SwiftUI

@main
struct class0523App: App {
    @EnvironmentObject var cat: Cat
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(cat)
        }
    }
}
