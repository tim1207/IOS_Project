//
//  Lab10App.swift
//  Lab10
//
//  Created by 林峻霆 on 2022/6/1.
//

import SwiftUI
import Firebase

@main
struct Lab10App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
