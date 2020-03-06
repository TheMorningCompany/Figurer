//
//  OptionsViewController.swift
//  Figurer
//
//  Created by Julian Wright on 2/10/20.
//  Copyright © 2020 Zeqe Golomb. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var invertNumpadSwitch: UISwitch!
    @IBOutlet weak var hapticsSwitch: UISwitch!
    @IBOutlet weak var infoSwitch: UISwitch!
    @IBOutlet weak var radianSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        registerSettingsBundle()
        NotificationCenter.default.addObserver(self, selector: #selector(defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        defaultsChanged()
        
        // Do any additional setup after loading the view.
    }
    
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    @objc func defaultsChanged(){
        if let invertNumpad:Bool = UserDefaults.standard.bool(forKey: "invert_numpad") {
            invertNumpadSwitch.setOn(invertNumpad, animated: false)
        }
        if let enableHaptics:Bool = UserDefaults.standard.bool(forKey: "enable_haptics") {
            hapticsSwitch.setOn(enableHaptics, animated: false)
        }
        if let moreInfo:Bool = UserDefaults.standard.bool(forKey: "more_info") {
            infoSwitch.setOn(moreInfo, animated: false)
        }
        if let useRadians:Bool = UserDefaults.standard.bool(forKey: "use_radians") {
            radianSwitch.setOn(useRadians, animated: false)
        }
    }
    
    @IBAction func invertSwitchValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(invertNumpadSwitch.isOn, forKey: "invert_numpad")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func hapticsSwitchValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(hapticsSwitch.isOn, forKey: "enable_haptics")
        UserDefaults.standard.synchronize()
    }
    @IBAction func radiansSwitchValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(radianSwitch.isOn, forKey: "use_radians")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "info"), object: nil)
    }
    
    @IBAction func infoSwitchValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(infoSwitch.isOn, forKey: "more_info")
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "info"), object: nil)
    }
    @IBAction func didTapLightIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName(nil)
    }
    @IBAction func didTapDarkIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName("darkicon")
    }
    @IBAction func didTapOrangeIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName("orangeicon")
    }
    @IBAction func didTapShadowIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName("shadowicon")
    }
    @IBAction func didTapGlyphIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName("glyphicon")
    }
    @IBAction func didTapFadeIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName("fadeicon")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
