//
//  BGView.swift
//  Figurer
//
//  Created by Zeqiel Golomb on 11/5/20.
//  Copyright © 2020 The Morning Company. All rights reserved.
//

import UIKit

class BGView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 20.0
        layer.cornerCurve = .continuous
        clipsToBounds = true
    }

}
