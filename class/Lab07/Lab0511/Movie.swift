//
//  Movie.swift
//  Lab0511
//
//  Created by 林峻霆 on 2022/5/11.
//

import Foundation

struct Movie: Identifiable {
    var id : String{name}
    let name:String
    let about:String
    let url:String
}
extension Movie {
    static let example = Movie(name: "怪獸與鄧不利多的秘密", about:"fghjklhjkbmbnfghjkcvbnmvbnghjk。", url: "https://www.vscinemas.com.tw/vsweb/film/detail.aspx?id=5713")
                                
}
