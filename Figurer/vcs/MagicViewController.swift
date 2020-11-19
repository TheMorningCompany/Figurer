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
    @IBOutlet weak var eightBallSwitch: UISwitch!
    @IBOutlet weak var textFieldBG: UIView!
    @IBOutlet weak var ToggleView: UIView!
    @IBOutlet weak var titleView: UIView!
    
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
        
        self.titleView.layer.cornerRadius = 20.0
        self.titleView.layer.cornerCurve = .continuous
        self.titleView.layer.masksToBounds = true
    }
    
    
    @IBAction func submit(_ sender: Any) {
        if let resultText = resultTextBox.text {
               UserDefaults.standard.set(resultText, forKey: "magicValue")
        }
    }

    func updateResultTextBox() {
        if let magicValue = UserDefaults.standard.string(forKey: "magicValue") {
            resultTextBox.text = magicValue
        } else {
            resultTextBox.text = ""
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
