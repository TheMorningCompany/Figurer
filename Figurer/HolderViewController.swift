//
//  HolderViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 2/4/21.
//  Copyright © 2021 The Morning Company. All rights reserved.
//

import UIKit

class HolderViewController: UIViewController {
    
    @IBOutlet weak var calcWidth: NSLayoutConstraint!
    @IBOutlet weak var graphView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice.current.userInterfaceIdiom == .phone {
            calcWidth.constant = UIScreen.main.bounds.width - 90

        } else {
            if !UIApplication.shared.isSplitOrSlideOver {
                calcWidth.constant = 340

            } else {
                calcWidth.constant = UIScreen.main.bounds.width - 90
            }
        }
        
        self.graphView.layer.cornerRadius = 20
        self.graphView.clipsToBounds = true
        
    }
    
    
}
