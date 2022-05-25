//
//  MovieDetail.swift
//  Lab0511
//
//  Created by 林峻霆 on 2022/5/11.
//

import SwiftUI
import SwiftUI

struct MovieDetail: View {
    let movie:Movie
    var body: some View {
        VStack{
            Link(destination: URL(string:movie.url)!, label:{
                Image(movie.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .shadow(radius: 30)
            })
            
            Text(movie.about)
                .padding()
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie.example)
    }
}


