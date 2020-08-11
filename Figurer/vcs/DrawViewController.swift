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
    @IBOutlet weak var penSizeSlider: UISlider!
    @IBOutlet weak var toolView: UIView!
    @IBOutlet weak var DrawViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var toolPickerLeading: NSLayoutConstraint!
    
    
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
    

        
    
    @IBAction func ShowHideRuler(_ sender: Any) {
        if self.canvasView.isRulerActive == false {
            self.canvasView.isRulerActive = true
        } else {
            self.canvasView.isRulerActive = false
        }

    }
    
    
    
    @IBAction func PenSizeSliderChange(_ sender: Any) {
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: penColor)!, width: CGFloat(penSizeSlider.value))
        print(penColor)
    }
    
    
    
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            performSegue(withIdentifier: "showMagicWindow", sender: sender)
        }
    }
    
    
    @IBAction func blackPen(_ sender: Any) {
        penColor = "BlackWhite"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "BlackWhite")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func redPen(_ sender: Any) {
        penColor = "Brick"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Brick")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func yellowPen(_ sender: Any) {
        penColor = "Ochre"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Ochre")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func greenPen(_ sender: Any) {
        penColor = "Forest"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Forest")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func tealPen(_ sender: Any) {
        penColor = "Teal"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Teal")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func bluePen(_ sender: Any) {
        penColor = "Ocean"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Ocean")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func purplePen(_ sender: Any) {
        penColor = "Lavender"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Lavender")!, width: CGFloat(penSizeSlider.value))
    }
    @IBAction func pinkPen(_ sender: Any) {
        penColor = "Magenta"
        self.canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "Magenta")!, width: CGFloat(penSizeSlider.value))
    }
    
    @IBAction func clearDrawing(_ sender: Any) {
        self.canvasView.tool = PKEraserTool(.bitmap)
        //Clear the pencilkit view
    }
    
    
    
    
    
    

}
