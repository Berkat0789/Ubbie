//
//  roundedtextField.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/10/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
@IBDesignable

class roundedtextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)

    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = self.frame.height / 4
    }

}
