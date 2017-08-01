//
//  ConnectEdDBDelegate.swift
//  Connect-Ed
//
//  Created by mac on 7/24/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation
import AWSDynamoDB
import AWSMobileHubHelper



class ConnectEdDBDelegate {
    
    class func getSignedInStudentId() -> String? {
        return AWSIdentityManager.default().identityId
    }
    
    //Look up user in Users table and return as Student object
    //Return nil if no user with given ID exists
    class func populateProfileView(_ profileViewController: ProfileViewController, userId: String?) {
        if userId != nil {
            UsersTable.getItem(hashKey: userId!, completionHandler: {(response: AWSDynamoDBObjectModel?, error: Error?) in
                if error != nil {
                    //Print error and return if failed
                    print("Error: \(String(describing: error))")
                    return
                }
                
                if let result = response as! UserDBModel? {
                    let student = Student(result)
                    
                    DispatchQueue.main.async() {
                        //Putting these on the main thread so that the labels update their displays
                        profileViewController.nameLabel.text = student.name
                        profileViewController.schoolLabel.text = student.school
                        profileViewController.majorLabel.text = student.major
                        profileViewController.locationLabel.text = student.location()
                        
                        profileViewController.profileImageView.image = student.profilePic
                    }
                }
            })
        }
    }
    
    class func updateProfile(name: String? = nil, school: String? = nil, major: String? = nil, state: String? = nil, city: String? = nil) {
        let userDBModel = UserDBModel()
        
        userDBModel?._userId = AWSIdentityManager.default().identityId!
        
        userDBModel?._name = name
        userDBModel?._school = school
        userDBModel?._major = major
        userDBModel?._state = state
        userDBModel?._city = city
        //userDBModel?._location = "None"
        
        UsersTable.addItem(userDBModel!)
    }
}
