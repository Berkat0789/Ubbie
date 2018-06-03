//
//  circleViewWithBorder.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class circleViewWithBorder: UIView {

    override func awakeFromNib() {
        SetupView()
    }
    //Set up ibinsectable for changing color and border width
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            SetupView()
        }
    }
    func SetupView() {
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = self.frame.width / 2
        
    }

}
