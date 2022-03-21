//
//  ViewController.swift
//  Fishdom_Memory_Match
//
//  Created by 林峻霆 on 2022/3/9.
//
// https://colorhunt.co/palette/f9ed69f08a5db83b5e6a2c70

import UIKit

class ViewController: UIViewController {
    
    var game = MatchingGame()
    
    var flipCount:Int = 0{
        didSet{//只要變動就會輸出
            flipLabel.text = "Flips:\(flipCount)"
        }
    }

    
    @IBOutlet weak var flipLabel: UILabel!
    var emojiChoices = ["🙂" , "🤪", "🥲", "🤣", "🙂" , "🤪", "🥲", "🤣","😍" , "🥶", "☹️", "😡", "😍" , "🥶", "☹️", "😡"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // outlet collection for more items
    // touch right side + can see items
    @IBAction func flipCount(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        { // sender 是點到的牌
            print("cardNumber = \(String(describing : cardNumber))") // is for check
            //        emojiChoices[cardNumber]
            if sender.currentTitle == emojiChoices[cardNumber]{
                sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.7232089043, green: 0.2321962714, blue: 0.3705306053, alpha: 1)
            }else{
                sender.setTitle(emojiChoices[cardNumber], for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.9405021667, green: 0.5444033742, blue: 0.3641401529, alpha: 1)
                // #colorLiteral(red: 1, green: 0.5, blue: 1, alpha: 1)
            }
            flipCount += 1
            // flipLabel.text = "Flips:\(flipCount)" 將由didSet直接變動處理
        }


        
    }
    //bad smell should delect connection
    /*
    @IBAction func touchCard(_ sender: UIButton) {
        if sender.currentTitle == "🙂"{
            sender.setTitle("", for: UIControl.State.normal)
            sender.backgroundColor = #colorLiteral(red: 0.7232089043, green: 0.2321962714, blue: 0.3705306053, alpha: 1)
        }else{
            sender.setTitle("🙂", for: UIControl.State.normal)
            sender.backgroundColor = #colorLiteral(red: 0.9405021667, green: 0.5444033742, blue: 0.3641401529, alpha: 1)
            // #colorLiteral(red: 1, green: 0.5, blue: 1, alpha: 1)
        }
        flipCount += 1
        // flipLabel.text = "Flips:\(flipCount)" 將由didSet直接變動處理
    
    }
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9769824147, green: 0.9301447868, blue: 0.4098855853, alpha: 1)
        // Do any additional setup after loading the view.
        for i in cardButtons{
            i.setTitle("", for: UIControl.State.normal)
            i.backgroundColor = #colorLiteral(red: 0.7232089043, green: 0.2321962714, blue: 0.3705306053, alpha: 1)
            // 初始化介面
        }
    }


}


