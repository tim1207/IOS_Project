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

    private (set)var cards = [Card]()
    private (set)var flipCount:Int = 0
    private (set)var score:Int = 10
    private var flipUp:Bool = false
    private (set)var theme:String = "face"
    var emojiDictionary = [Int:String]()
    //    var emoji:Dictionary<Int,String>
    //    var emoji=Dictionary<Int,String>
    //    var emojiDictionary = [Int:String]()

    let themeEmoji = [
        
        "face": ["🙂" , "🤪", "🥲", "🤣", "😍" , "🥶", "☹️", "😡"],
        "animal":["🐶" , "🐱", "🐭", "🐹", "🐰" , "🦊", "🐻", "🐼"],
        "ball" :["⚽️" , "🏀", "🏈", "⚾️", "🥎" , "🎾", "🏐", "🏉"],
        "number" :["1️⃣" , "2️⃣", "3️⃣", "4️⃣", "5️⃣" , "6️⃣", "7️⃣", "8️⃣"]
    ]
    var emoji:[String]? = []
    private var indexOfOneAndOnlyFaceUpCard:Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
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
                    
                    flipCount -= 1
                    score = score + 30
                }//matched
                else{
                    score -= 10
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = index
            }// has another previous card face up
            
            else if let matchIndex=indexOfOneAndOnlyFaceUpCard, matchIndex == index{
                indexOfOneAndOnlyFaceUpCard = nil
            }//翻同一張牌
            
            else{//no cards face up or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            // TODO
        }

    }
    
    private func randomTheme(){
        let index: Int = Int(arc4random_uniform(UInt32(themeEmoji.count)))
        theme = Array(themeEmoji.keys)[index]
        emoji = themeEmoji[theme]
    }
        
    func flip(){
        flipUp = !flipUp
        for index in cards.indices {
            cards[index].isFaceUp = flipUp
        }
        score -= 1000
    }
    
    func getEmoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil, emoji!.count > 0{
//            let randomIndex = Int(arc4random_uniform(UInt32(game.emoji!.count)))
            let randomIndex = emoji!.count.arc4random
            emojiDictionary[card.identifier] = emoji?.remove(at: randomIndex)// remove same index
            
        }
        return emojiDictionary[card.identifier] ??  "?"
    }
    
    init(numberOfPairsOfCards: Int){
        randomTheme()
        cards .removeAll()
        flipCount = 0
        score = 0
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
