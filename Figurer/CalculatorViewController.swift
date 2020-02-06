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
    var num_operator:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        resultLabel.text = String(sender.tag - 1)
    }
    
    @IBAction func special(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            resultLabel.text = String(Double.pi)
            break
        case 2:
            resultLabel.text = "."
            break
        default:
            break
        }
    }
    
    @IBAction func operators(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            num_operator = "="
            break;
        case 2:
            num_operator = "+"
            break
        case 3:
            num_operator = "-"
            break
        case 4:
            num_operator = "*"
            break
        case 5:
            num_operator = "/"
            break
        default:
            break
        }
        resultLabel.text = num_operator
    }
    
    @IBAction func function(_ sender: UIButton) {
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
            resultLabel.text = String(result)
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        default:
            break
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
