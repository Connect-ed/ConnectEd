//
//  ConnectEdDBDelegate.swift
//  Connect-Ed
//
//  Created by mac on 7/24/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation



class ConnectedEdDBDelegate {
    let conversationTable = ConversationTable()
    let userTable = UsersTable()
    
    
    init() {
        
    }
    
    
    func updateProfile(name: String? = nil, school: String? = nil, major: String? = nil, location: String? = nil) {
        UsersTable().addItem(name: name, school: school, major: major, location: location)
    }
}
