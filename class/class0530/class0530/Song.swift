//
//  Song.swift
//  class0530
//
//  Created by 林峻霆 on 2022/5/30.
//

import Foundation

import FirebaseFirestoreSwift

struct Song: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let singer: String
    let rate: Int
}
