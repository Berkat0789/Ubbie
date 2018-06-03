//
//  roundedShadowView.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class roundedShadowView: UIView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }
}
