//
//  Student.swift
//  Connect-Ed
//
//  Created by mac on 6/15/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation

class Student {
    var UUID: u_long
    
    var name: String = ""
    var school: String = ""
    var major: String = ""
    var state: String = ""
    var city: String = ""
    
    
    init(UUID: u_long) {
        self.UUID = UUID
    }
}


class HighSchoolStudent: Student {
    
}


class CollegeStudent: Student {
    
}
