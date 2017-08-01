//
//  UserDBModel.swift
//  Connect-Ed
//
//  Created by mac on 7/24/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation
import UIKit
import AWSDynamoDB



class UserDBModel: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var _userId: String?
    
    var _city: String?
    var _location: String?
    var _major: String?
    var _name: String?
    var _school: String?
    var _state: String?
    
    
    class func dynamoDBTableName() -> String {
        return "connected-mobilehub-2025034993-Users"
    }
    
    class func hashKeyAttribute() -> String {
        return "_userId"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
            "_userId" : "userId",
            "_city" : "city",
            "_location" : "location",
            "_major" : "major",
            "_name" : "name",
            "_school" : "school",
            "_state" : "state",
        ]
    }
}
