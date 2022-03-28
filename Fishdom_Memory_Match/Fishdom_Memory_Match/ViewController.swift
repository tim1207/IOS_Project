//
//  ViewController.swift
//  Fishdom_Memory_Match
//
//  Created by 林峻霆 on 2022/3/9.
//
// https://colorhunt.co/palette/f9ed69f08a5db83b5e6a2c70

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingGame(numberOfPairsOfCards: (cardButtons.count+1)/2)
    //i.e. game will be initialized when someone try to use it but lazy variable cannot have didSet!
    
    var flipCount:Int = 0{
        didSet{//只要變動就會輸出
            flipLabel.text = "Flips:\(flipCount)"
        }
    }

    @IBOutlet weak var flipLabel: UILabel!
    
    var emojiChoices = ["🙂" , "🤪", "🥲", "🤣", "😍" , "🥶", "☹️", "😡",]
    
//    var emoji:Dictionary<Int,String>
//    var emoji=Dictionary<Int,String>
    var emojiDictionary = [Int:String]()
    
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
        flipCount += 1

    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.7232089043, green: 0.2321962714, blue: 0.3705306053, alpha: 1)
                // #colorLiteral(red: 1, green: 0.5, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999999404, green: 1, blue: 0.9999999404, alpha: 0.5) : #colorLiteral(red: 0.9405021667, green: 0.5444033742, blue: 0.3641401529, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)// remove same index
            
        }
        return emojiDictionary[card.identifier] ??  "?"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9769824147, green: 0.9301447868, blue: 0.4098855853, alpha: 1)
        // Do any additional setup after loading the view.
        for i in cardButtons{
            i.setTitle("", for: UIControl.State.normal)
            i.backgroundColor = #colorLiteral(red: 0.9405021667, green: 0.5444033742, blue: 0.3641401529, alpha: 1)
            // 初始化介面
        }
    }


}


