//
//  StudentTableViewCell.swift
//  Connect-Ed
//
//  Created by mac on 6/16/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!

    
    func setStudent(_ student: Student) {
        nameLabel.text = student.name
        schoolLabel.text = student.school
        locationLabel.text = student.location()
        majorLabel.text = student.major
        
        profileImageView.image = student.profilePic
    }
    
    //Can also set a school in these cells, for the Favorites view
    func setSchool(_ school: School) {
        nameLabel.text = school.name
        schoolLabel.text = ""
        locationLabel.text = school.location()
        majorLabel.text = ""
        
        profileImageView.image = school.image
    }
}
