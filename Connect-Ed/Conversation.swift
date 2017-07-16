//
//  Message.swift
//  Connect-Ed
//
//  Created by mac on 6/25/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import Foundation



class Conversation {
    var UUID: u_long = 0
    var messages: [Message] = []    //list of messages, in order from newest to oldest
    
    
    func loadMessages(count: Int) {
        //TODO: Load <count> older messages from server
    }
    
    func sendMessage(text: String) {
        //TODO
    }
    
    func update() {
        //TODO: Check server for new messages or "Thanks!"
    }
    
    
    class Message {
        var conversation: Conversation? = nil
        var UUID: u_long = 0
        var senderUUID: u_long = 0
        var timestamp: Date = Date()
        var text: String = ""
        var hasThanks: Bool = false     //true if "Thanks!" has been given to message
        
        
        init(conversation: Conversation? = nil, UUID: u_long = 0, senderUUID: u_long = 0, timestamp: Date = Date(), text: String = "", hasThanks: Bool = false) {
            self.conversation = conversation
            self.UUID = UUID
            self.senderUUID = senderUUID
            self.timestamp = timestamp
            self.text = text
            self.hasThanks = hasThanks
        }
        
        
        func setThanks(_ thanks: Bool) {
            if thanks && !self.hasThanks {
                //TODO: Send "Thanks!" to server
            }
            else if !thanks && self.hasThanks {
                //TODO: Remove "Thanks!" from server
                
            }
            
            self.hasThanks = thanks
        }
    }
}
