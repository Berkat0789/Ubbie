//
//  DataService.swift
//  Ubbie
//
//  Created by Berkat Bhatti  on 6/10/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import Foundation
import Firebase
var firebase_Base = Database.database().reference()

class DataService  {
    static var instance = DataService()
    
    private(set) public var DB_Reference = firebase_Base
    private(set) public var db_Reference_Users = firebase_Base.child("Users")
    private(set) public var db_Reference_drivers = firebase_Base.child("Drivers")
    private(set) public var db_Reference_trips = firebase_Base.child("trips")

    
    //--Func to create DB User
    
    func createDBUser(UID: String, userData: Dictionary<String, Any>, isDriver: Bool) {
        if isDriver {
            db_Reference_drivers.child(UID).updateChildValues(userData)
        } else {
            db_Reference_Users.child(UID).updateChildValues(userData)
        }
    }

    
}
