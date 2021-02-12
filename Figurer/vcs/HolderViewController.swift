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
    @IBOutlet weak var middleSeparator: NSLayoutConstraint!
    @IBOutlet weak var graphLeft: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice.current.userInterfaceIdiom == .phone {
            
            graphView.isHidden = false
            middleSeparator.constant = 120
            graphLeft.constant = -80
        } else {
            if !UIApplication.shared.isSplitOrSlideOver {
                calcWidth.constant = 340
                graphView.isHidden = false
                middleSeparator.constant = 20
                graphLeft.constant = 20

            } else {
                
                middleSeparator.constant = 20
                graphLeft.constant = 20
            }
        }
        
        self.graphView.layer.cornerRadius = 20
        self.graphView.clipsToBounds = true
        
    }
    
    
}
