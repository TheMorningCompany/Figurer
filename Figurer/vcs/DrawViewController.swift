//
//  DrawViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 2/4/21.
//  Copyright © 2021 The Morning Company. All rights reserved.
//

import UIKit
import PencilKit
import PhotosUI

class DrawViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {

    
    
    @IBOutlet weak var canvasView: PKCanvasView!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var stackView: UIStackView!
    
    var penSize = UserDefaults.standard.integer(forKey: "penSize")
    var penColor = UserDefaults.standard.string(forKey: "penColor")
    
    let canvasWidth: CGFloat = 768
    let canvasOverscrollHeight: CGFloat = 500
    
    var drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvasView.layer.cornerCurve = .continuous
        canvasView.layer.cornerRadius = 20
        canvasView.clipsToBounds = true
        stackView.layer.cornerRadius = 20
        stackView.layer.cornerCurve = .continuous
        stackView.clipsToBounds = true
        
        
        canvasView.delegate = self
        canvasView.drawing = drawing
        
        
        canvasView.alwaysBounceVertical = true
        canvasView.allowsFingerDrawing = true
        
        if let window = parent?.view.window,
           let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
        }
        
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
        
        sizeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        
    }
    
    @IBAction func sliderChanged() {
        UserDefaults.standard.set(sizeSlider.value, forKey: "penSize")
        penSize = UserDefaults.standard.integer(forKey: "penSize")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    
    
    @IBAction func undo(_ sender: Any) {
        canvasView.undoManager?.undo()
    }
    @IBAction func redo(_ sender: Any) {
        canvasView.undoManager?.redo()
    }
    @IBAction func save(_ sender: Any) {
        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, true, UIScreen.main.scale)
        
        canvasView.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image!)
            }, completionHandler: {success, error in
                
            })
        }
    }
    @IBAction func brick(_ sender: Any) {
        UserDefaults.standard.set("brick", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func ochre(_ sender: Any) {
        UserDefaults.standard.set("ochre", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func forest(_ sender: Any) {
        UserDefaults.standard.set("forest", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func teal(_ sender: Any) {
        UserDefaults.standard.set("teal", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func ocean(_ sender: Any) {
        UserDefaults.standard.set("ocean", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func violet(_ sender: Any) {
        UserDefaults.standard.set("violet", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func magenta(_ sender: Any) {
        UserDefaults.standard.set("magenta", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    @IBAction func dark(_ sender: Any) {
        UserDefaults.standard.set("dark", forKey: "penColor")
        penColor = UserDefaults.standard.string(forKey: "penColor")
        canvasView.tool = PKInkingTool(.pen, color: UIColor(named: "\(penColor ?? "dark")")!, width: CGFloat(penSize))
    }
    
    
    
    
    
}

