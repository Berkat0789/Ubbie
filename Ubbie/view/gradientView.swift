//
//  gradientView.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
@IBDesignable
class gradientView: UIView {

    override func awakeFromNib() {
        setupGradientView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupGradientView()
    }
    let gradient = CAGradientLayer()
    
    
    func setupGradientView() {
        gradient.frame = self.layer.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
    }
}
