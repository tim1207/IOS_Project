//
//  RightPersonView.swift
//  AppClass0509
//
//  Created by 林峻霆 on 2022/5/9.
//

import SwiftUI

struct RightPersonView: View {
    var body: some View {
        Image("pic")
            .resizable()
            .scaledToFit()
            .navigationTitle("spider man")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct RightPersonView_Previews: PreviewProvider {
    static var previews: some View {
        RightPersonView()
    }
}
