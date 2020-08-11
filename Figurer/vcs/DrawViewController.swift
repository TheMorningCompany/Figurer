//
//  DrawViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 8/10/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit
import PencilKit

class DrawViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {

    
    @IBOutlet weak var canvasView: PKCanvasView!
    
    //Some drawing stuffs
    let canvasWidth: CGFloat = 768
    let canvasOverscrollHeight: CGFloat = 500
    var drawing = PKDrawing()
    var penColor = "BlackWhite"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

                
        //More drawing stuff
        if UIDevice.current.userInterfaceIdiom == .pad {
        canvasView.delegate = self
        canvasView.drawing = drawing

        canvasView.alwaysBounceVertical = true
        canvasView.allowsFingerDrawing = true
        
        if let window = parent?.view.window,
            let toolPicker = PKToolPicker.shared(for: window) {
            
            toolPicker.setVisible(false, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            
            canvasView.becomeFirstResponder()
            
        }
        }
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
    }
    

        


    

}
