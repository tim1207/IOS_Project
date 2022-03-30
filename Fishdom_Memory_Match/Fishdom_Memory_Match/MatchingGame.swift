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
    var flipCount:Int = 0
    var flipUp:Bool = false
    var indexOfOneAndOnlyFaceUpCard:Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{

            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    func chooseCard(at index : Int){
        if !cards[index].isMatched{
            flipCount += 1
            if let matchIndex=indexOfOneAndOnlyFaceUpCard, matchIndex != index{// , = and
                    
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    cards[index].isFaceUp = true
                    flipCount -= 1
                }//matched
                
                indexOfOneAndOnlyFaceUpCard = index
            }// has another previous card face up
            else if let matchIndex=indexOfOneAndOnlyFaceUpCard, matchIndex == index{// , = and

                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{//no cards face up or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            
        }

    }
        
    func flip(){
        flipCount = 0
        flipUp = !flipUp
        for index in cards.indices {
            cards[index].isFaceUp = flipUp
        }
    }
    init(numberOfPairsOfCards: Int){
        cards .removeAll()
        flipCount = 0
        flipUp = false
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
        cards.shuffle()
        // this is a struct
    }

}


// let oddNumbers=[1,3,5,7,9]
// var emptyFloats: Array<Float> = Array(repeating: 0,count: 10) //()內可留空
