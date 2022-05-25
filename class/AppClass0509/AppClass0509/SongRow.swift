//
//  SongRow.swift
//  AppClass0509
//
//  Created by 林峻霆 on 2022/5/9.
//

import SwiftUI

struct SongRow: View {
    let song: Song
    var body: some View {
        HStack {
            Image(song.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(song.name)
                Text(song.singer)
            }
            Spacer()
        }
    }
    
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song.demoSong)
            .previewLayout(.sizeThatFits)
    }
}

