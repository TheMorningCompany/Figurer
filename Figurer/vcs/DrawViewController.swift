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
    @IBOutlet weak var saveImg: Calcbutton!
    @IBOutlet weak var saveImgWidth: NSLayoutConstraint!
    @IBOutlet weak var saveImgRight: NSLayoutConstraint!
    
    var penSize = UserDefaults.standard.integer(forKey: "penSize")
    var penColor = UserDefaults.standard.string(forKey: "penColor")
    var expanded = false
    
    let canvasWidth: CGFloat = 768
    let canvasOverscrollHeight: CGFloat = 500
    
    var drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
     if expanded == false {
        expanded = true
        saveImgWidth.constant = 60
        saveImgRight.constant = 3
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
            self.saveImgWidth.constant = 40
            self.saveImgRight.constant = 10
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            })
            self.expanded = false
        }

     } else {
        saveImgWidth.constant = 65
        saveImgRight.constant = 1
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
        saveImg.setImage(UIImage(systemName: "checkmark"), for: .normal)
        
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
        Timer.scheduledTimer(withTimeInterval: 1.4, repeats: false) { timer in
            self.saveImg.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
            self.saveImgWidth.constant = 40
            self.saveImgRight.constant = 10
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            })
        }
        expanded = false
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
    @IBAction func showRuler(_ sender: Any) {
        if canvasView.isRulerActive == false {
            canvasView.isRulerActive = true
        } else {
            canvasView.isRulerActive = false
        }
    }
    
    
    
}

