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
    @IBOutlet weak var degButton: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    var num_operator:Int = -1
    var operator_strings = ["=", "+", "-", "×", "÷", "^", "log"]
    enum num_operators:Int {
        case EQUALS = 1
        case ADD = 2
        case SUBTRACT = 3
        case MULTIPLY = 4
        case DIVIDE = 5
        case POWER = 6
        case LOG = 7
    }

    var numberOnScreen:Double = 0.0
    var previousNumber:Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        equationViewer.text = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(infoChanged), name: NSNotification.Name(rawValue: "info"), object: nil)
        
        infoChanged()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func infoChanged() {
        if let moreInfo:Bool = UserDefaults.standard.bool(forKey: "more_info") {
            if (moreInfo) {
                degButton.isHidden = false
                if let useRadians:Bool = UserDefaults.standard.bool(forKey: "use_radians") {
                    degButton.setTitle(useRadians ? "rad" : "deg", for: UIControl.State.normal)
                    settingsBtn.isHidden = false
                }
            } else {
                degButton.isHidden = true
                settingsBtn.isHidden = true
            }
        }
    }
    
    @IBAction func doTheClearScreen(_ sender: UIGestureRecognizer) {
        resetScreen()
    }
    
    @IBAction func degButtonValueChanged(_ sender: UIButton) {
        if let buttonValue:String = degButton.title(for: UIControl.State.normal) {
            let newState = buttonValue == "deg" ? "rad" : "deg"
            UserDefaults.standard.set(newState == "rad", forKey: "use_radians")
            degButton.setTitle(newState, for: UIControl.State.normal)
        }
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
    
    func radToDeg(value: Double) -> Double {
        return Double(value) / (Double.pi / 180)
    }
    
    func logb(val: Double, forBase base: Double) -> Double {
        let result = log(val)/log(base)
        if let useRadians:Bool = UserDefaults.standard.bool(forKey: "use_radians") {
            if (!useRadians) {
                return radToDeg(value: result)
            }
        }
        return result
    }

    //MARK: Number Buttons
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if ((equationViewer.text?.contains("="))! || resultLabel.text == "error") {
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

    //MARK: Special Buttons
    
    @IBAction func special(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            updateDisplay(value: String(Double.pi))
            if (equationViewer.text == "") {
                equationViewer.text = "π"
            } else {
                equationViewer.text! += "π"
            }
            numberOnScreen = Double.pi
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

    //MARK: Operator Buttons
    
    @IBAction func operators(_ sender: UIButton) {
        
        if ((equationViewer.text?.contains("="))!) {
            equationViewer.text = resultLabel.text
        }
        
        if (operator_strings.contains(resultLabel.text!)) {
            return
        }
        
        if (resultLabel.text == "" || operator_strings.contains(resultLabel.text!)) {
            updateDisplay(value: "0")
        }
        
        if (sender.tag == num_operators.EQUALS.rawValue) {
            var result = 0.0
//            var regex:NSRegularExpression
//            do {
//                regex = try NSRegularExpression(pattern: "([^0-9+-÷*])")
//                let textToTry = String((equationViewer.text?.filter {!" ".contains($0)})!)
//                print("TO TRY: \(textToTry)")
//                var matches = regex.matches(in: textToTry, range: NSRange(location: 0, length: textToTry.count))
//                if (matches.count > 0) {
//                    regex = try NSRegularExpression(pattern: "(^((?!sin|cos|tan|log).)*$)")
//                    matches = regex.matches(in: textToTry, range: NSRange(location: 0, length: textToTry.count))
//                    if (matches.count == 0) {
//                        print("IT WORKED: \(matches)")
//                    }
//                } else {
//                    print("NO MATCHES")
//                }
//            } catch {
//                print("ERROR OCCURRED")
//            }
            if (num_operator != -1 && num_operator != num_operators.EQUALS.rawValue) {
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
                        UIApplication.shared.setAlternateIconName("divideicon")
                    }
                    result = previousNumber / numberOnScreen
                    break
                case num_operators.POWER.rawValue:
                    result = pow(previousNumber, numberOnScreen)
                    break
                case num_operators.LOG.rawValue:
                    result = logb(val: previousNumber, forBase: numberOnScreen)
                    break
                default:
                    break
                }
            } else {
                result = numberOnScreen
            }
            
            if (!(result.isNaN) && result.isFinite) {
                print(result)
                updateDisplay(value: String(result))
                equationViewer.text! += " = " + resultLabel.text!
                numberOnScreen = Double(resultLabel.text!)!
            } else {
                resetScreen()
                resultLabel.text = "error"
            }
        }
        
        if (!(resultLabel.text == "error")) {
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
        case 7:
            num_operator = num_operators.LOG.rawValue
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

    // MARK: Function Buttons
    
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
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                if let inputNum = input {
                    if (inputNum < 0.0) {
                        print("SQRT NEGATIVE")
                        UIApplication.shared.setAlternateIconName("negativeicon")
                        break
                    }
                }
                let result = sqrt(input!)
                updateDisplay(value: String(result))
                break
            case 3:
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = input! / 100
                updateDisplay(value: String(result))
                equationViewer.text! += "%"
                break
            case 4:
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = sqrt(input!)
                updateDisplay(value: String(result))
                break
            case 5:
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = input! * -1
                updateDisplay(value: String(result))
                var equationText = equationViewer.text
                if (equationText!.contains(" ")) {
                    
                    if (Int.signum(Int(input!))() == 1) {
                        let endIndex = equationText!.range(of: " ", options: .backwards)!.lowerBound
                        let range = ...endIndex
                        equationText = String(equationText![range]) + "-" + String(equationText![equationText!.index(after: endIndex)...])
                    } else if (Int.signum(Int(input!))() == -1) {
                        let endIndex = equationText!.range(of: "-", options: .backwards)!.lowerBound
                        let range = ..<endIndex
                        equationText = String(equationText![range]) + String(equationText![equationText!.index(after: endIndex)...])
                    }
                }
                equationViewer.text = equationText
                break
            case 6:
                //ln
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = logb(val: input!, forBase: M_E)
                updateDisplay(value: String(result))
                break
            case 7:
                //sin
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = sin(input!)
                updateDisplay(value: String(result))
                break
            case 8:
                //cos
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = cos(input!)
                updateDisplay(value: String(result))
                break
            case 9:
                //tan
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                let result = tan(input!)
                updateDisplay(value: String(result))
                break
            case 10:
                //cos-1
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                var result = acos(input!)
                if let useRadians:Bool = UserDefaults.standard.bool(forKey: "use_radians") {
                    result = radToDeg(value: result)
                }
                updateDisplay(value: String(result))
                break;
            case 11:
                //tan-1
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                var result = atan(input!)
                if let useRadians:Bool = UserDefaults.standard.bool(forKey: "use_radians") {
                    result = radToDeg(value: result)
                }
                updateDisplay(value: String(result))
                break;
            case 12:
                //sin-1
                if (resultLabel.text == "" || resultLabel.text == "error") {
                    break
                }
                let input = Double(resultLabel.text!)
                var result = asin(input!)
                if let useRadians:Bool = UserDefaults.standard.bool(forKey: "use_radians") {
                    result = radToDeg(value: result)
                }
                updateDisplay(value: String(result))
                break;
            default:
                break
            }
        } else {
            if (sender.tag == 1) {
                resultLabel.text = ""
                var equationText = equationViewer.text
                equationText = String((equationText?.dropLast())!)
                if (equationText!.contains(" ")) {
                    let endIndex = equationText!.range(of: " ", options: .backwards)!.lowerBound
                    let range = ...endIndex
                    equationText = String(equationText![range])
                }
                equationViewer.text = equationText
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
