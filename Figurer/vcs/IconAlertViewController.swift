//
//  IconAlertViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 4/1/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class IconAlertViewController: UIViewController {

    @IBOutlet weak var BG: UIView!
    @IBOutlet weak var Icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BG.layer.cornerRadius = 25
        Icon.layer.cornerRadius = 25
    }
    

}
