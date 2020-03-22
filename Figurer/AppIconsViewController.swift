//
//  AppIconsViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 3/22/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class AppIconsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        @IBAction func didTapLightIcon(_ sender: UIButton) {
        doHaptic()
        UIApplication.shared.setAlternateIconName(nil)
        }
}
