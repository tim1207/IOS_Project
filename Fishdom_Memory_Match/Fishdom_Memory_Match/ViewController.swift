//
//  ViewController.swift
//  Fishdom_Memory_Match
//
//  Created by 林峻霆 on 2022/3/9.
//
// https://colorhunt.co/palette/f9ed69f08a5db83b5e6a2c70

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingGame(numberOfPairsOfCards: numberOfPairsOfCard)
    //i.e. game will be initialized when someone try to use it but lazy variable cannot have didSet!
    var numberOfPairsOfCard : Int{
        get{ // 只有get也可以直接 return
            return(cardButtons.count+1)/2
        }
//        set
    }

    @IBOutlet weak var flipLabel: UILabel!
    
    
    @IBOutlet weak var Theme: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // outlet collection for more items
    // touch right side + can see items
    @IBAction func flipCount(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        { // sender 是點到的牌
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
                        // flipLabel.text = "Flips:\(flipCount)" 將由didSet直接變動處理
        }else{
            print("not in collection")
        }

    }
    
    @IBAction func flipall(_ sender: Any) {
        game.flip()
        updateViewFromModel()
    }
    
    @IBAction func resetCard(_ sender: Any) {
        game = MatchingGame(numberOfPairsOfCards: numberOfPairsOfCard)
        updateViewFromModel()
        
    }
    
    func updateViewFromModel(){
        flipLabel.text = "Flips:\(game.flipCount)"
        scoreLabel.text = "Score:\(game.score)"
        Theme.text = "theme:\(game.theme)"

        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(game.getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.7232089043, green: 0.2321962714, blue: 0.3705306053, alpha: 1)
                // #colorLiteral(red: 1, green: 0.5, blue: 1, alpha: 1)
            }else {
                    if card.isMatched{
                        button.setTitle(game.getEmoji(for: card), for: UIControl.State.normal)
                        button.backgroundColor = #colorLiteral(red: 0.9999999404, green: 1, blue: 0.9999999404, alpha: 0.5)
                    }
                    else{
                        button.setTitle("", for: UIControl.State.normal)
                        button.backgroundColor = #colorLiteral(red: 0.9405021667, green: 0.5444033742, blue: 0.3641401529, alpha: 1)
                    }
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension Int{
    var arc4random :Int{
        if self>0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self<0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
        
    }
}




