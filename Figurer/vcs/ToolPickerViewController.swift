//
//  ToolPickerViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 8/10/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class ToolPickerViewController: UITableViewController {
   
    @IBOutlet weak var penSizeSlider: UISlider!
    
    var calcVC = CalculatorViewController()
    
    var penSizeToolPicker = 12.5
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.layer.borderWidth = 0.50
        self.navigationController!.navigationBar.layer.borderColor = UIColor.clear.cgColor
        self.navigationController?.navigationBar.clipsToBounds = true
    }
    
    var penColorFromPicker = ""

    @IBAction func blackPen(_ sender: Any) {
        penColorFromPicker = "BlackWhite"
    }
    @IBAction func redPen(_ sender: Any) {
        penColorFromPicker = "Brick"
    }
    @IBAction func yellowPen(_ sender: Any) {
        penColorFromPicker = "Ochre"
    }
    @IBAction func greenPen(_ sender: Any) {
        penColorFromPicker = "Forest"
    }
    @IBAction func tealPen(_ sender: Any) {
        penColorFromPicker = "Teal"
    }
    @IBAction func BluePen(_ sender: Any) {
        penColorFromPicker = "Ocean"
    }
    @IBAction func PurplePen(_ sender: Any) {
        penColorFromPicker = "Lavender"
    }
    @IBAction func PinkPen(_ sender: Any) {
        penColorFromPicker = "Magenta"
    }
    
   @IBAction func dismiss(_ sender: Any) {
       dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func penSizeChange(_ sender: Any) {
        penSizeToolPicker = Double(penSizeSlider.value)
        print(penSizeToolPicker)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("will DISAPPEAR")
        
        NotificationCenter.default.post(name: SIZE_NOTIFICATION, object: penSizeToolPicker)
        NotificationCenter.default.post(name: COLOR_NOTIFICATION, object: penColorFromPicker)
    }
    
    
}
