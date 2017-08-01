//
//  Student.swift
//  Connect-Ed
//
//  Created by mac on 6/15/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation
import UIKit



class Student {
    var userID: String = ""
    
    var name: String = ""
    var school: String = ""
    var major: String = ""
    var state: String = ""
    var city: String = ""
    
    var profilePic: UIImage = #imageLiteral(resourceName: "photo")
    
    
    init(userID: String? = nil, name: String? = nil, school: String? = nil, major: String? = nil, state: String? = nil, city: String? = nil, profilePic: UIImage? = nil) {
        if userID != nil {
            self.userID = userID!
        }
        
        if name != nil {
            self.name = name!
        }
        
        if school != nil {
            self.school = school!
        }
        
        if major != nil {
            self.major = major!
        }
        
        if state != nil {
            self.state = state!
        }
        
        if city != nil {
            self.city = city!
        }
        
        if profilePic != nil {
            self.profilePic = profilePic!
        }
    }
    
    convenience init(_ userDBModel: UserDBModel?) {
        if userDBModel != nil {
            self.init(userID: userDBModel?._userId, name: userDBModel?._name, school: userDBModel?._school, major: userDBModel?._major, state: userDBModel?._state, city: userDBModel?._city, profilePic: nil)
        }
        else {
            self.init()
        }
    }
    
    
    func location() -> String {
        var locationString = self.city
        
        if self.city != "" && self.state != "" {
            locationString.append(", ")
        }

        locationString.append(self.state)
        
        return locationString
    }
}


class HighSchoolStudent: Student {
    
}


class CollegeStudent: Student {
    
}
