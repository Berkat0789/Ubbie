//
//  roundedImage.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class roundedImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        SetupView()
    }
    
    func SetupView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.width / 2
    }

}
