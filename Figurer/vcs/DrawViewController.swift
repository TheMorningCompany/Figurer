//
//  DrawViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 2/4/21.
//  Copyright © 2021 The Morning Company. All rights reserved.
//

import UIKit
import PencilKit

class DrawViewController: UIViewController {

    @IBOutlet weak var canvasView: PKCanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let window = parent?.view.window,
           let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
        }
    }
    
}

