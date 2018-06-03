//
//  roundedShadowButton.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class roundedShadowButton: UIButton {

    
    override func awakeFromNib() {
     setupView()
    }
    var originalSize: CGRect?
    func setupView() {
        originalSize = self.frame
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
    }
    
    func animateButton(isLoading: Bool, withMessage messsage: String?) {
        let spinner = UIActivityIndicatorView()
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        spinner.color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        spinner.hidesWhenStopped = true
        
        if isLoading {
            self.setTitle("", for: UIControlState.normal)
            UIView.animate(withDuration: 0.2, animations: {
                //animate corner radius and frame from rectangle to circle
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
            }) { (completed) in
                if completed {
                    self.addSubview(spinner)
                    spinner.startAnimating()
                    spinner.center = CGPoint(x: self.frame.width / 2, y: self.frame.width / 2)
                    UIView.animate(withDuration: 0.2, animations: {
                        spinner.alpha = 1.0
                    })
                }
            }
            self.isUserInteractionEnabled = false
        } else {
            self.isUserInteractionEnabled = true
        }
    }

}
