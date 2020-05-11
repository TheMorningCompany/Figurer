//
//  AppIconsViewController.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 3/22/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class AppIconsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func whiteIcon(_ sender: Any) {
        UIApplication.shared.setAlternateIconName("orangeicon")
    }
    @IBAction func darkIcon(_ sender: Any) {
        UIApplication.shared.setAlternateIconName("darkicon")
    }
    @IBAction func orangeIcon(_ sender: Any) {
        UIApplication.shared.setAlternateIconName(nil)
    }
    @IBAction func shadowIcon(_ sender: Any) {
        UIApplication.shared.setAlternateIconName("shadowicon")
    }
    @IBAction func neonIcon(_ sender: Any) {
        UIApplication.shared.setAlternateIconName("glyphicon")
    }
    @IBAction func fadeIcon(_ sender: Any) {
        UIApplication.shared.setAlternateIconName("fadeicon")
    }
    


}
