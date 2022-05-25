//
//  SecondTab.swift
//  class0523
//
//  Created by 林峻霆 on 2022/5/23.
//

import SwiftUI

struct SecondTab: View {
//    @ObservedObject var cat: Cat
    @EnvironmentObject var cat: Cat
    @State private var show = false
    var body: some View {
        VStack {
            Text("2-1")
                .font(.largeTitle)
            Image(systemName: "\(cat.age).circle")
                .resizable()
                .frame(width: 200, height: 200)
            Button {
                show = true
            } label: {
                Text("Go")
            }
        }
        .sheet(isPresented: $show, content: {
            SecondDetailView()
        })
    }
}

struct SecondTab_Previews: PreviewProvider {
    static var previews: some View {
//        SecondTab(cat: Cat())
        SecondTab()
            .environmentObject(Cat())
    }
}
