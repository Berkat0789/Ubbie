//
//  HomeVC.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/3/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView

class HomeVC: UIViewController, MKMapViewDelegate{
//Outets
    @IBOutlet weak var mapView: MKMapView!
//Variables and arrays
    let splashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))

    override func viewDidLoad() {
        self.view.addSubview(splashView)
        splashView.animationType = SplashAnimationType.heartBeat
        splashView.startAnimation()
        splashView.heartAttack = true
        
        super.viewDidLoad()
        mapView.delegate = self

    }


}
