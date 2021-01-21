//
//  LogViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 1/20/21.
//  Copyright © 2021 The Morning Company. All rights reserved.
//

import UIKit

class LogViewController: UITableViewController {

    @IBOutlet weak var baseField: UITextField!
    @IBOutlet weak var xfield: UITextField!
    @IBOutlet weak var answer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer.text = "answer"
        
    }
    func baseField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
    
    @IBAction func xChanged(_ sender: Any) {
        if baseField.text != "" {
            
        }
    }
}
