//
//  MovieRow.swift
//  Lab0511
//
//  Created by 林峻霆 on 2022/5/11.
//

import SwiftUI

struct MovieRow: View {
    let movie:Movie
    var body: some View {
        
        HStack{
            Image(movie.name)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipped()
          
            Text(movie.name)
            Spacer()
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie.example)
            .previewLayout(.sizeThatFits)
    }
}
