//
//  loginVC.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/10/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class loginVC: UIViewController {
    
//--Outlets
    
    @IBOutlet weak var emailField: roundedtextField!
    @IBOutlet weak var passwordField: roundedtextField!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    @IBOutlet weak var authButton: roundedShadowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bindToKeyboard()
        addTaptoView()

    }
    
//Actions
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func AuthButtonPressed(_ sender: Any) {
        guard let email = emailField.text, emailField.text != "" || emailField.text == nil else {return}
        guard let password = passwordField.text, passwordField.text != "" || passwordField.text == nil else {return}
        
        if segmentedView.selectedSegmentIndex == 0 {
            AuthService.instance.loginUser(email: email, password: password, isDriverStatus: false) { (success) in
                if success {
                    //perform segue to home user loged in
                } else {
                    //cant login and and does not exist so we will create user
                    AuthService.instance.RegisterUser(email: email, password: password, driverStatus: false, completed: { (success) in
                        if success {
                            print("User Created and did not have account")
                        }
                    })
                }
            }
            
        } else {
            //segmented is not 0 meaning user is now a driver
            AuthService.instance.loginUser(email: email, password: password, isDriverStatus: true) { (success) in
                if success {
                    //perform segue to home
                } else {
                    //create driver
                    AuthService.instance.RegisterUser(email: email, password: password, driverStatus: true, completed: { (success) in
                        if success {
                            //Perform Segue to home 
                        }
                    })
                }
            }
        }
        
    }
    
    
//--Gestures and animations
    
    func addTaptoView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(taptoDismiss(_:)))
        self.view.addGestureRecognizer(tap)
    }
//Selectors
    @objc func taptoDismiss(_ recon: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

}
