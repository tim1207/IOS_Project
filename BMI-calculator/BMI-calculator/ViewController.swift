//
//  ViewController.swift
//  BMI-calculator
//
//  Created by 林峻霆 on 2022/3/4.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightStatus: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var bmiCalculator: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBAction func button(_ sender: Any) {
        let h = Float(heightField.text!)!/100.0
        let w = Float(weightField.text!)!
        let bmi=(w/(h*h))
        bmiCalculator.text=String(bmi)
        if(gender.selectedSegmentIndex==0){
            if(Float(bmiCalculator.text!)!<18.5){
                weightStatus.text="Under Weight"
            }
            if(24.9>Float(bmiCalculator.text!)! && Float(bmiCalculator.text!)!>18.5){
                weightStatus.text="Health Weight"
            }
            if(29.9>Float(bmiCalculator.text!)! && Float(bmiCalculator.text!)!>24.9){
                weightStatus.text="Over Weight"
            }
            if(Float(bmiCalculator.text!)!>29.9){
                weightStatus.text="Obesity"
            }
        }

           
        if(gender.selectedSegmentIndex==1){
            if(Float(bmiCalculator.text!)!<18.5){
                weightStatus.text="Under Weight"
            }
            if(24.9>Float(bmiCalculator.text!)! && Float(bmiCalculator.text!)!>18.5){
                weightStatus.text="Health Weight"
            }
            if( Float(bmiCalculator.text!)!>24.9){
                weightStatus.text="It's a secret"
            }
        }

        
    }
    
//    @IBAction func indexChange(_ sender: Any) {
//
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

