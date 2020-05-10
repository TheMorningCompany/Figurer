//
//  MagicViewController.swift
//  Figurer
//
//  Created by Julian Wright on 5/9/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {

    @IBOutlet weak var resultTextBox: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateResultTextBox()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let resultText = resultTextBox.text
        UserDefaults.standard.set(resultText, forKey: "magicValue")
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "magicValue")
        updateResultTextBox()
    }
    
    func updateResultTextBox() {
        if let magicValue = UserDefaults.standard.string(forKey: "magicValue") {
            resultTextBox.text = magicValue
        } else {
            resultTextBox.text = ""
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
