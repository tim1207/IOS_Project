//
//  MatchingGame.swift
//  Fishdom_Memory_Match
//
//  Created by 林峻霆 on 2022/3/16.
//

// MVC 中的 model
import Foundation
// class has inheritance is reference type


class MatchingGame{
   
//    var cards:[Card] = [Card]()
//    var cards:[Card] = []
//    var cards: Array<Card> = Array()
//    四種都可以

    var cards = [Card]()
    
    func chooseCard(at index : Int){
        
    }
    
    init(numberOfPairsOfCards: Int){
        for i in 1...numberOfPairsOfCards {
            
            let card = Card(identifier: i)
            /* 同下一組
            cards.append(card)
            let matchingCard = Card(identifier: i)
            cards.append(matchingCard)
            */
            
            // Card is struct pass by value
            /* 同下一組
            cards.append(card)
            cards.append(card)
            */
            
            cards += [card,card]
            
        }
        // this is a struct
    }

}


// let oddNumbers=[1,3,5,7,9]
// var emptyFloats: Array<Float> = Array(repeating: 0,count: 10) //()內可留空