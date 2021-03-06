//
//  Card.swift
//  Fishdom_Memory_Match
//
//  Created by 林峻霆 on 2022/3/16.
//

import Foundation
// no inheritance is value type
// copy on write semantics
struct Card : Hashable
{   //Type 'Card' does not conform to protocol 'Hashable'
    var hashValue: Int{
        return identifier
    }
    // if use default will match all value
    
    static func ==(lhs:Card,rhs:Card)->Bool{
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    
    var isMatched = false
    
    private var identifier:Int  // use ID , not emoji
    
//    init(identifier i :Int){
//        // 外部參數名 內部參數名 型態
//        identifier = i
//    }
    static var identifierFactory = 0

    static func getUniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }

    init(){
        self.identifier=Card.getUniqueIdentifier()
    }
}


