//
//  FirstTab.swift
//  class0523
//
//  Created by 林峻霆 on 2022/5/23.
//

import SwiftUI

struct FirstTab: View {
//    @ObservedObject var cat: Cat
    @EnvironmentObject var cat: Cat
    @State private var show = false
    var body: some View {
        VStack {
            Text("1-1")
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
            FirstDetailView()
        })
    } }

struct FirstTab_Previews: PreviewProvider {
    static var previews: some View {
//        FirstTab(cat: Cat())
        FirstTab()
            .environmentObject(Cat())
    }
}
