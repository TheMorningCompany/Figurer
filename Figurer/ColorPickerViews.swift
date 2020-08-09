//
//  ColorPickerViews.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 8/9/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class ColorPickerViews: UIButton {

    override func awakeFromNib() {

     layer.cornerRadius = self.frame.height / 2.0
     layer.masksToBounds = true

    }
}
