//
//  School.swift
//  Connect-Ed
//
//  Created by mac on 6/16/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation
import UIKit



class School {
    var UUID: u_long
    
    var name: String
    var state: String
    var city: String
    
    var image: UIImage?
    
    
    init(UUID: u_long = 0, name: String = "", state: String = "", city: String = "", image: UIImage? = #imageLiteral(resourceName: "photo")) {
        self.UUID = UUID
        
        self.name = name
        self.state = state
        self.city = city
        
        self.image = image
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


class HighSchool: Student {
    
}


class College: Student {
    
}
