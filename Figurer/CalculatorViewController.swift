//
//  CalculatorViewController.swift
//  Figurer
//
//  Created by Julian Wright on 2/5/20.
//  Copyright © 2020 Zeqe Golomb. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var num_operator:Int = -1
    
    var operator_strings = ["=", "+", "-", "×", "÷", "^"]
    enum num_operators:Int {
        case EQUALS = 1
        case ADD = 2
        case SUBTRACT = 3
        case MULTIPLY = 4
        case DIVIDE = 5
        case POWER = 6
    }

    var numberOnScreen:Double = 0.0
    var previousNumber:Double = 0.0
    var performingMath = false

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    func updateDisplay(value: String) {
        var newValue = value
        if (value.contains(".") && !(value.suffix(1) == "0")) {
            newValue += "0"
        }
        let doubleResult = Double(newValue)
        if (round(doubleResult!) == doubleResult) {
            resultLabel.text = String(Int(round(doubleResult!)))
            print("ROUNDED", String(resultLabel.text!))
        } else {
            print("NOT ROUNDED", newValue)
            resultLabel.text = newValue
        }
    }

    @IBAction func numbers(_ sender: UIButton) {
        
        if (resultLabel.text == "" || operator_strings.contains(resultLabel.text!)) {
            updateDisplay(value: String(sender.tag - 1))
        } else {
            resultLabel.text! += String(sender.tag - 1)
        }
        
        numberOnScreen = Double(resultLabel.text!)!
    }

    @IBAction func special(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            updateDisplay(value: String(Double.pi))
            break
        case 2:
            if (resultLabel.text == "") {
                resultLabel.text = "0."
            } else {
                if (!(resultLabel.text?.contains("."))!) {
                    resultLabel.text! += "."
                }
            }
            break
        default:
            break
        }
    }

    @IBAction func operators(_ sender: UIButton) {
        if (resultLabel.text == "" || operator_strings.contains(resultLabel.text!)) {
            updateDisplay(value: "0")
        }
        
        performingMath = true
        
        if (sender.tag == num_operators.EQUALS.rawValue && performingMath) {
            if (num_operator != -1) {
                var result = 0.0
                switch num_operator {
                case num_operators.ADD.rawValue:
                    result = previousNumber + numberOnScreen
                    break
                case num_operators.SUBTRACT.rawValue:
                    result = previousNumber - numberOnScreen
                    break
                case num_operators.MULTIPLY.rawValue:
                    result = previousNumber * numberOnScreen
                    break
                case num_operators.DIVIDE.rawValue:
                    result = previousNumber / numberOnScreen
                    break
                case num_operators.POWER.rawValue:
                    result = pow(previousNumber, numberOnScreen)
                    break
                default:
                    break
                }
                updateDisplay(value: String(result))
            }
            performingMath = false
        }
        
        previousNumber = Double(resultLabel.text!) as! Double
        
        switch sender.tag {
        case 1:
            num_operator = num_operators.EQUALS.rawValue
            break
        case 2:
            num_operator = num_operators.ADD.rawValue
            break
        case 3:
            num_operator = num_operators.SUBTRACT.rawValue
            break
        case 4:
            num_operator = num_operators.MULTIPLY.rawValue
            break
        case 5:
            num_operator = num_operators.DIVIDE.rawValue
            break
        case 6:
            num_operator = num_operators.POWER.rawValue
            break
        default:
            break
        }
        
        if (sender.tag != num_operators.EQUALS.rawValue) {
            resultLabel.text = String(operator_strings[num_operator - 1])
        }
    }

    @IBAction func function(_ sender: UIButton) {
        if (!operator_strings.contains(resultLabel.text!)) {
            switch sender.tag {
            case 1:
                if (resultLabel.text == "") {
                    
                } else {
                    resultLabel.text = ""
                }
                break
            case 2:
                if (resultLabel.text == "") {
                    break
                }
                var input = Double(resultLabel.text!)
                var result = sqrt(input!)
                updateDisplay(value: String(result))
                break
            case 3:
                if (resultLabel.text == "") {
                    break
                }
                var input = Double(resultLabel.text!)
                var result = input! / 100
                updateDisplay(value: String(result))
                break
            case 4:
                if (resultLabel.text == "") {
                    break
                }
                var input = Double(resultLabel.text!)
                var result = sqrt(input!)
                updateDisplay(value: String(result))
                break
            case 5:
                if (resultLabel.text == "") {
                    break
                }
                var input = Double(resultLabel.text!)
                var result = input! * -1
                updateDisplay(value: String(result))
                break
            default:
                break
            }
        }
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
