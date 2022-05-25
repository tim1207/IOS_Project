//
//  ContentView.swift
//  class0523
//
//  Created by 林峻霆 on 2022/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var lover = Lover()
    var body: some View {
        VStack(alignment: .leading) {
            Text("名字: \(lover.name)")
            Text("單身: \(lover.isSingle.description)")
            Button {
                lover.isSingle.toggle()
            } label: {
                Text("改變感情狀態")
            }
            Button {
                lover.name = "Mary"
            } label: {
                Text("改名")
            }
        }
        .font(.largeTitle)
    } }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
