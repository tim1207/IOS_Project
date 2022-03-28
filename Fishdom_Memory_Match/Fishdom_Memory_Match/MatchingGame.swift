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
    
    var indexOfOneAndOnlyFaceUpCard:Int? // optional Int
    
    func chooseCard(at index : Int){
        if !cards[index].isMatched{
            
            if let matchIndex=indexOfOneAndOnlyFaceUpCard, matchIndex != index{// , = and
                    
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }//matched
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }// has another previous card face up
            else if let matchIndex=indexOfOneAndOnlyFaceUpCard, matchIndex == index{// , = and
                cards[index].isFaceUp = false
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{//no cards face up or 2 cards are face up
                for flipDownIndex in cards.indices{
                    if cards[flipDownIndex].isMatched != true{
                        cards[flipDownIndex].isFaceUp = false
                    }
                }//all cards set back to face down
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }

    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
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
