//
//  SonhList.swift
//  AppClass0509
//
//  Created by 林峻霆 on 2022/5/9.
//

import SwiftUI

struct SongList: View {
    let songs = [
        Song(name: "對的時間點", singer: "林俊傑", lyrics: "如果 愛情是場 遠程的渦旋 僅管 繞著圈子 也要走向前 不離心不脫離軌道有你在身邊"),
        Song(name: "Be better", singer: "畢書盡", lyrics: "如果 愛情是場 遠程的渦旋 僅管 繞著圈子 也要走向前 不離心不脫離軌道有你在身邊")
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(songs){
                    song in SongRow(song: song)
                }
            }
            .navigationTitle("情歌王")
        }
        
    }
}

struct SonhList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
