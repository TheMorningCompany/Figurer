//
//  OptionsViewController.swift
//  Figurer
//
//  Created by Julian Wright on 2/10/20.
//  Copyright © 2020 Zeqe Golomb. All rights reserved.
//

import UIKit

class OptionsViewController: UITableViewController {

//    @IBOutlet weak var invertNumpadSwitch: UISwitch!
//    @IBOutlet weak var hapticsSwitch: UISwitch!
//    @IBOutlet weak var infoSwitch: UISwitch!
//    @IBOutlet weak var radianSwitch: UISwitch!
//    @IBOutlet weak var titleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        registerSettingsBundle()
//        NotificationCenter.default.addObserver(self, selector: #selector(defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
//        defaultsChanged()
//
        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.layer.borderWidth = 0.50
        self.navigationController!.navigationBar.layer.borderColor = UIColor.clear.cgColor
        self.navigationController?.navigationBar.clipsToBounds = true
        let backBarButtton = UIBarButtonItem(title: "",style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
//        self.titleView.layer.cornerRadius = 20.0
//        self.titleView.layer.cornerCurve = .continuous
//        self.titleView.layer.masksToBounds = true
    }
    
//    func registerSettingsBundle(){
//        let appDefaults = [String:AnyObject]()
//        UserDefaults.standard.register(defaults: appDefaults)
//    }
    
//    @objc func defaultsChanged(){
//         let invertNumpad = UserDefaults.standard.bool(forKey: "invert_numpad")
//         if (invertNumpad){
//            invertNumpadSwitch.setOn(invertNumpad, animated: false)
//        }
//         let enableHaptics = UserDefaults.standard.bool(forKey: "enable_haptics")
//         if (enableHaptics){
//            hapticsSwitch.setOn(enableHaptics, animated: false)
//        }
//         let moreInfo = UserDefaults.standard.bool(forKey: "more_info")
//         if (moreInfo){
//            infoSwitch.setOn(moreInfo, animated: false)
//        }
//         let useRadians = UserDefaults.standard.bool(forKey: "use_radians")
//         if (useRadians) {
//            radianSwitch.setOn(useRadians, animated: false)
//        }
//    }
//
//    @IBAction func invertSwitchValueChanged(_ sender: UISwitch) {
//        UserDefaults.standard.set(invertNumpadSwitch.isOn, forKey: "invert_numpad")
//        UserDefaults.standard.synchronize()
//    }
//
//    @IBAction func hapticsSwitchValueChanged(_ sender: UISwitch) {
//        UserDefaults.standard.set(hapticsSwitch.isOn, forKey: "enable_haptics")
//        UserDefaults.standard.synchronize()
//    }
//    @IBAction func radiansSwitchValueChanged(_ sender: UISwitch) {
//        UserDefaults.standard.set(radianSwitch.isOn, forKey: "use_radians")
//        UserDefaults.standard.synchronize()
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "info"), object: nil)
//    }
//
//    @IBAction func infoSwitchValueChanged(_ sender: UISwitch) {
//        UserDefaults.standard.set(infoSwitch.isOn, forKey: "more_info")
//        UserDefaults.standard.synchronize()
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "info"), object: nil)
//    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  

}
