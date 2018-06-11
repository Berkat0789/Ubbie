//
//  AuthService.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/10/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
//Login and register user
    
    func loginUser(email: String, password: String, isDriverStatus: Bool, completed: @escaping (_ done: Bool)-> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (done, error) in
            if error != nil {
                guard let errorCode = AuthErrorCode(rawValue: error!._code) else {return}
                switch errorCode {
                case .emailAlreadyInUse:
                    print("Email in use")
                default:
                    print("Credentials are not in our database")
                }
            } else {
                if isDriverStatus == true {
                    let userData = ["email": email, "isinDriverMode": true, "IsDriverModeOn" : false, "IsOnTrip":false] as [String : Any]
                    DataService.instance.createDBUser(UID: currentUserID, userData: userData, isDriver: isDriverStatus)
                } else {
                    let userData  = ["email" :email]
                    DataService.instance.createDBUser(UID: currentUserID, userData: userData, isDriver: isDriverStatus)
                }
            }
        }
    }
    
//--Register user
    
    func RegisterUser(email: String, password: String, driverStatus: Bool, completed: @escaping (_ done: Bool) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (success, error) in
            if error != nil {
                guard let errorCode = AuthErrorCode(rawValue: error!._code) else {return}
                switch errorCode {
                case .emailAlreadyInUse:
                    print("Email in use")
                default:
                    print("Credentials are not in our database")
                }
            } else {
                if driverStatus == true {
                    let userData = ["email": email, "isinDriverMode": true, "IsDriverModeOn" : false, "IsOnTrip":false] as [String : Any]
                    DataService.instance.createDBUser(UID: currentUserID, userData: userData, isDriver: driverStatus)
                } else {
                    let userData  = ["email" :email]
                    DataService.instance.createDBUser(UID: currentUserID, userData: userData, isDriver: driverStatus)
                }
            }
        }
    }
    
    
}
