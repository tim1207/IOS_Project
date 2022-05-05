//
//  ViewController.swift
//  Calculator
//
//  Created by 林峻霆 on 2022/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var decimalPointButton: UIButton!
    @IBOutlet var numberButtons: [UIButton]!
    
    @IBOutlet var operateButtons: [UIButton]!
    @IBOutlet weak var textLabel: UILabel!
    var newCalculation: Bool = false
    
    @IBOutlet weak var calculate: UILabel!
    var buttonColor3: Bool = false
    var buttonColor4: Bool = false
    var buttonColor5: Bool = false
    var buttonColor6: Bool = false
    
    var output: Double = 0.0
    var equation: String = ""{
        didSet{
            if((equation.contains("+") || equation.contains("-") || equation.contains("/") || equation.contains("*") ) && !equation.isEmpty)
            {
                operateButtons[0].setTitle("C", for: UIControl.State.normal)
            }
            else if( true || equation.first == ("-")){
                operateButtons[0].setTitle("AC", for: UIControl.State.normal)
            }
            if(equation == "inf"){
                equation = "0"
                textLabel.text! = "0"
            }
            
            updateButton(equation: equation)
            calculate.text! = equation
        }
    }
    var decimal: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "0"
        
        for i in 0...9{
            setCornerRadius(button: numberButtons[i])
        }
        
        for i in 0...6{
            setCornerRadius(button: operateButtons[i])
        }
        
        setCornerRadius(button: decimalPointButton)
        setCornerRadius(button: equalButton)
    }
    
    func setCornerRadius(button: UIButton){
        button.clipsToBounds = true
        button.layer.cornerRadius = 30
    }
    
    @IBAction func numberButtonPress(_ sender: UIButton) {
        let inputNumber = sender.tag
        if equation.last == "."{
            decimal = true
        }
        if textLabel.text == "0"{
            textLabel.text = String(inputNumber)
            equation += String(inputNumber)
        }else{
            textLabel.text! += String(inputNumber)
            equation += String(inputNumber)
        }
    }
    
    func checkEquation(equation:String) -> Bool {
        if (equation.last == "+" || equation.first == ("-") || equation.last == "-" || equation.last == "/" || equation.last == "*") {
            return true
        }
        else{
            return false
        }
    }
    
    func updateButton(equation:String) {
        let button3 = operateButtons[3]
        let button4 = operateButtons[4]
        let button5 = operateButtons[5]
        let button6 = operateButtons[6]
        if (equation.last == "/") {
            button3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else if (equation.last == "*") {
            button4.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else if (equation.last == "-") {
            button5.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        else if (equation.last == "+") {
            button6.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        else{
            button3.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            button4.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            button5.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            button6.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }
    
    @IBAction func operateButtonPress(_ sender: UIButton) {
        let origText = textLabel.text // if always number
        textLabel.text  = ""
        
        if equation == ""{
            equation = "0"
        }else {
            if decimal == false{
                equation += ""
            }
        }
        
        switch sender.tag{
            // AC
        case 0:
            if textLabel.text == "0" {
                equation = "0"
            }
            if( equation.first == ("-")){
                equation.removeAll()
            }
            
            else if((equation.contains("+") || equation.contains("-") || equation.contains("/") || equation.contains("*")) && !equation.isEmpty)
            {
                equation.removeLast()
            }
            else{
                equation.removeAll()
            }
            
            // +/-
        case 1:
            if let origText = origText{
                if origText.contains("-"){
                    textLabel.text = origText.replacingOccurrences(of: "-", with: "")
                }else if origText == "0"{
                    textLabel.text = "0"
                }else if origText != ""{
                    textLabel.text = "-" + origText
                }
            }
            equation +=  "*-1"
            
            // %
        case 2:
            equation += "*0.01"
            let expression = NSExpression(format: equation)
            output = expression.expressionValue(with: nil, context: nil) as! Double
            textLabel.text = setStringFormat(output: output, decimal: 7 )
            var outputresult = String(output)
            while(outputresult.last == "0" || outputresult.last == "."){
                outputresult.removeLast()
                print(outputresult)
            }
            equation = String(outputresult)
            decimal = true
  
            // /
        case 3:
            if checkEquation(equation: equation) {
                equation.removeLast()
            }
            equation += "/"
            
            // *
        case 4:
            if checkEquation(equation: equation) {
                equation.removeLast()
            }
            equation += "*"
            
            // -
        case 5:
            if checkEquation(equation: equation) {
                equation.removeLast()
            }
            equation += "-"
            
            // +
        case 6:
            if checkEquation(equation: equation) {
                equation.removeLast()
            }
            equation += "+"
            
            
        default:
            textLabel.text = "Warning!!!"
            break
        }
        
        decimal = false
    }
    
    @IBAction func pressDecimalPoint(_ sender: UIButton) {
        let origText = textLabel.text
        
        if let origText = origText {
            if !origText.contains("."){
                equation += "."
                textLabel.text! += "."
                decimal = true
            }
        }
    }
    
    @IBAction func pressEqualButton(_ sender: UIButton) {
        if decimal == false{
            equation += ".0"
        }
        
        let expression = NSExpression(format: equation)
        output = expression.expressionValue(with: nil, context: nil) as! Double
        
        textLabel.text = setStringFormat(output: output, decimal: 7 )
        var outputresult = String(output)
        while(outputresult.last == "0" || outputresult.last == "."){
            outputresult.removeLast()
            print(outputresult)
        }
        equation = String(outputresult)
        decimal = true
    }
    
    func setStringFormat(output:Double, decimal:Int) -> String{
        if output.truncatingRemainder(dividingBy: 1.0) == 0{
            return String(format: "%.0f", output)
        }
        let numOfDigit = pow(10.0, Double(decimal))
        return String((output * numOfDigit).rounded(.toNearestOrAwayFromZero)/numOfDigit)
    }
    
}

