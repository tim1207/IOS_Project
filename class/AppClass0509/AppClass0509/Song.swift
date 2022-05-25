//
//  Song.swift
//  AppClass0509
//
//  Created by 林峻霆 on 2022/5/9.
//

import Foundation
struct Song: Identifiable {
    let id = UUID()
    let name: String
    let singer: String
    let lyrics: String
}
extension Song {
    static let demoSong = Song(name: "對的時間點", singer: "林俊傑", lyrics: "如果 愛情是場 遠程的渦旋 僅管 繞著圈子 也要走向前 不離心太遠 我要面朝最藍的晴天 不脫離軌道有你在身邊")
}
