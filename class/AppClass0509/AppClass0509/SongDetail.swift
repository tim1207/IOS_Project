//
//  SongDetail.swift
//  AppClass0509
//
//  Created by 林峻霆 on 2022/5/9.
//

import SwiftUI

struct SongDetail: View {
    let song: Song
    var body: some View {
        VStack{
            CircleImage(song: song)
            Text(song.lyrics).padding()
        }
        .navigationTitle(song.name)
        
    }
}

struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song:.demoSong)
    }
}

struct CircleImage:View{
    let song:Song
    var body: some View {
        Image(song.name)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .shadow(radius: 10)
        
        
    }
}
