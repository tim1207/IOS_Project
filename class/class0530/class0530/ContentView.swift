//
//  ContentView.swift
//  class0530
//
//  Created by 林峻霆 on 2022/5/30.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @FirestoreQuery(collectionPath: "songs") var songs:[Song]
    
    var body: some View {
        VStack{
            
            List{
                
                ForEach(songs){ song in
                    HStack{
                        Text("\(song.singer)")
                        Text(song.name)
                        Text("\(song.rate)")
                    }
                }
            }
            Button{
                createSong()
            }label: {
                Text("create")
            }
        }
    }
    func createSong() {
        let db = Firestore.firestore()
        
        let song = Song(name: "陪你\(Int.random(in: 0...10))", singer: "小球", rate: 5)
        do {
            let documentReference = try db.collection("songs").addDocument(from: song)
            print(documentReference.documentID)
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
