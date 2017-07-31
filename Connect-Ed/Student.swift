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
    var userID: String
    
    var name: String
    var school: String
    var major: String
    var state: String
    var city: String
    
    var profilePic: UIImage?
    
    
    init(userID: String = "", name: String = "", school: String = "", major: String = "", state: String = "", city: String = "", profilePic: UIImage? = #imageLiteral(resourceName: "photo")) {
        self.userID = userID
        
        self.name = name
        self.school = school
        self.major = major
        self.state = state
        self.city = city
        
        self.profilePic = profilePic
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
