//
//  NavController.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class NavController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    @IBAction func Login(_ sender: Any) {
        let loginController = storyboard?.instantiateViewController(withIdentifier: "Login_signupVC") as? loginVC
         present(loginController!, animated: true, completion: nil)
    }
    
}
