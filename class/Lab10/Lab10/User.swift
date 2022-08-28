//
//  User.swift
//  Lab10
//
//  Created by 林峻霆 on 2022/6/1.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    let username: String
    let password: String
    let emailAddress: String
}
