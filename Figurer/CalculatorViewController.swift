//
//  CalculatorViewController.swift
//  Figurer
//
//  Created by Julian Wright on 2/5/20.
//  Copyright © 2020 Zeqe Golomb. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var equationViewer: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var num_operator:Int = -1
    let impact = UIImpactFeedbackGenerator()//haptics
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

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        equationViewer.text = ""
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
            resultLabel.text = newValue
        }
    }
    
    func resetScreen() {
        resultLabel.text = ""
        equationViewer.text = ""
        previousNumber = 0.0
        numberOnScreen = 0.0
    }

    @IBAction func numbers(_ sender: UIButton) {
        
        if ((equationViewer.text?.contains("="))! || resultLabel.text == "ERROR") {
            resetScreen()
        }
        
        if (resultLabel.text == "" || operator_strings.contains(resultLabel.text!)) {
            updateDisplay(value: String(sender.tag - 1))
        } else {
            resultLabel.text! += String(sender.tag - 1)
        }
        
        if (equationViewer.text == "") {
            equationViewer.text = String(sender.tag - 1)
        } else {
            equationViewer.text! += String(sender.tag - 1)
        }
        
        numberOnScreen = Double(resultLabel.text!)!
    }

    @IBAction func special(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            updateDisplay(value: String(Double.pi))
            break
        case 2:
            if (resultLabel.text == "" || operator_strings.contains(resultLabel.text!)) {
                resultLabel.text = "0."
                if (equationViewer.text == "") {
                    equationViewer.text = "0."
                } else {
                    equationViewer.text! += "0."
                }
            } else if (!(resultLabel.text?.contains("."))!) {
                resultLabel.text! += "."
                equationViewer.text! += "."
                
            }
            break
        default:
            break
        }
    }

    @IBAction func operators(_ sender: UIButton) {
        
        if ((equationViewer.text?.contains("="))!) {
            equationViewer.text = resultLabel.text
        }
        
        if (resultLabel.text == "" || operator_strings.contains(resultLabel.text!)) {
            updateDisplay(value: "0")
        }
        
        if (sender.tag == num_operators.EQUALS.rawValue) {
            if (num_operator != -1 && num_operator != num_operators.EQUALS.rawValue) {
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
                    if (numberOnScreen == 0) {
                        print("DIVIDE BY 0")
                    }
                    result = previousNumber / numberOnScreen
                    break
                case num_operators.POWER.rawValue:
                    result = pow(previousNumber, numberOnScreen)
                    break
                default:
                    break
                }
                if (!(result.isNaN) && result.isFinite) {
                    print(result)
                    updateDisplay(value: String(result))
                    equationViewer.text! += " = " + resultLabel.text!
                } else {
                    resetScreen()
                    resultLabel.text = "ERROR"
                }
            } else {
                let result = numberOnScreen
                updateDisplay(value: String(result))
                equationViewer.text! += " = " + resultLabel.text!
            }
            numberOnScreen = Double(resultLabel.text!)!
            print(numberOnScreen)
        }
        
        if (!(resultLabel.text == "ERROR")) {
            previousNumber = Double(resultLabel.text!)!
        } else {
            previousNumber = 1 / 0
        }
        
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
            if (equationViewer.text == "") {
                equationViewer.text = String(operator_strings[num_operator - 1])
            } else {
                equationViewer.text! += " " + String(operator_strings[num_operator - 1]) + " "
            }
        }
    }

    @IBAction func function(_ sender: UIButton) {
        if (!operator_strings.contains(resultLabel.text!)) {
            switch sender.tag {
            case 1:
                if (resultLabel.text == "") {
                    resetScreen()
                } else {
                    resultLabel.text = ""
                    var equationText = equationViewer.text
                    if (equationText!.contains(" ")) {
                        let endIndex = equationText!.range(of: " ", options: .backwards)!.lowerBound
                        let range = ...endIndex
                        equationText = String(equationText![range])
                    }
                    equationViewer.text = equationText
                }
                break
            case 2:
                if (resultLabel.text == "" || resultLabel.text == "ERROR") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = sqrt(input!)
                updateDisplay(value: String(result))
                break
            case 3:
                if (resultLabel.text == "" || resultLabel.text == "ERROR") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = input! / 100
                updateDisplay(value: String(result))
                equationViewer.text! += "%"
                break
            case 4:
                if (resultLabel.text == "" || resultLabel.text == "ERROR") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = sqrt(input!)
                updateDisplay(value: String(result))
                break
            case 5:
                if (resultLabel.text == "" || resultLabel.text == "ERROR") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = input! * -1
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
