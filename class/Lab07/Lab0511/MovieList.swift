//
//  MovieList.swift
//  Lab0511
//
//  Created by 林峻霆 on 2022/5/11.
//
import SwiftUI

struct MovieList: View {
    let movies = [
        Movie.example,
        Movie(name: "奇異博士2", about: "漫威宇宙進入第四階段，格局更宏大的多重宇宙，一個充滿危險，多重現實、奇異交錯的未知世界。奇異博士與信念相合的夥伴、神秘的盟友、還有敵我難分的故人，被迫闖入超乎想像的另類現實，抵抗神秘強大的對手。", url: "https://www.vscinemas.com.tw/vsweb/film/detail.aspx?id=5733"),
        Movie(name: "奇異博士3", about: "漫威宇宙進入第四階段，格局更宏大的多重宇宙，一個充滿危險，多重現實、奇異交錯的未知世界。奇異博士與信念相合的夥伴、神秘的盟友、還有敵我難分的故人，被迫闖入超乎想像的另類現實，抵抗神秘強大的對手。", url: "https://www.vscinemas.com.tw/vsweb/film/detail.aspx?id=5733"),
        Movie(name: "奇異博士4", about: "漫威宇宙進入第四階段，格局更宏大的多重宇宙，一個充滿危險，多重現實、奇異交錯的未知世界。奇異博士與信念相合的夥伴、神秘的盟友、還有敵我難分的故人，被迫闖入超乎想像的另類現實，抵抗神秘強大的對手。", url: "https://www.vscinemas.com.tw/vsweb/film/detail.aspx?id=5733"),
        Movie(name: "奇異博士5", about: "漫威宇宙進入第四階段，格局更宏大的多重宇宙，一個充滿危險，多重現實、奇異交錯的未知世界。奇異博士與信念相合的夥伴、神秘的盟友、還有敵我難分的故人，被迫闖入超乎想像的另類現實，抵抗神秘強大的對手。", url: "https://www.vscinemas.com.tw/vsweb/film/detail.aspx?id=5733"),
        Movie(name: "奇異博士6", about: "漫威宇宙進入第四階段，格局更宏大的多重宇宙，一個充滿危險，多重現實、奇異交錯的未知世界。奇異博士與信念相合的夥伴、神秘的盟友、還有敵我難分的故人，被迫闖入超乎想像的另類現實，抵抗神秘強大的對手。", url: "https://www.vscinemas.com.tw/vsweb/film/detail.aspx?id=5733"),
        
    ]
    let columns = [GridItem()]
    var body: some View {
        NavigationView{
          
            List{
                ScrollView(.horizontal){
                    HStack(spacing: 20){
                        ForEach(movies){movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                Image(movie.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 150)
                            }

                            
                        }
                    }
                }
                LazyVGrid(columns: columns) {
                    ForEach(movies){ movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            MovieRow(movie: movie)
                        }

                    }
                }
                
            }
            .navigationTitle("電影")
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
