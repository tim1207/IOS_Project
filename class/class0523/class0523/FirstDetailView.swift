//
//  FirstDetailView.swift
//  class0523
//
//  Created by 林峻霆 on 2022/5/23.
//

import SwiftUI

struct FirstDetailView: View {
//    @ObservedObject var cat: Cat
    @EnvironmentObject var cat: Cat

    var body: some View {
        VStack {
            Text("1-2")
            Image(systemName: "\(cat.age).circle")
                .resizable()
                .frame(width: 200, height: 200)
            Stepper(value: $cat.age){
                Text("age")
            }
        }
        
    }
    
}


struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView()
            .environmentObject(Cat())
    }
}
