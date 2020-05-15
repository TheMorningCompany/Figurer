//
//  MagicViewController.swift
//  Figurer
//
//  Created by Julian Wright on 5/9/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class MagicViewController: UITableViewController {

    @IBOutlet weak var resultTextBox: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateResultTextBox()
        self.resultTextBox.text = ""
        self.resultTextBox.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
        self.navigationController!.navigationBar.layer.borderWidth = 0.50
        self.navigationController!.navigationBar.layer.borderColor = UIColor.clear.cgColor
        self.navigationController?.navigationBar.clipsToBounds = true
        let backBarButtton = UIBarButtonItem(title: "",style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
    
    
    @IBAction func submit(_ sender: Any) {
        let resultText = resultTextBox.text
               UserDefaults.standard.set(resultText, forKey: "magicValue")
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