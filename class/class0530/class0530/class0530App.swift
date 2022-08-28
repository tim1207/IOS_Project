//
//  class0530App.swift
//  class0530
//
//  Created by 林峻霆 on 2022/5/30.
//

import SwiftUI
import Firebase

@main
struct class0530App: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
