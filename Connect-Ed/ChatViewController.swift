//
//  ChatViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/14/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var conversationID: u_long = 0
    var conversation: Conversation? = nil
    
    var messageEntryBarOriginalY: CGFloat = CGFloat()
    var messagesTableViewOriginalHeight: CGFloat = CGFloat()
    
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var messageEntryBar: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        
        //Auto size rows to messages
        messagesTableView.estimatedRowHeight = 44.0
        messagesTableView.rowHeight = UITableViewAutomaticDimension
        
        //Remove the empty rows at the end of the table
        messagesTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        messageEntryBarOriginalY = messageEntryBar.frame.origin.y
        messagesTableViewOriginalHeight = messagesTableView.frame.height
        
        //Bind function to the keyboard showing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        //Add gesture recognizer to tableview to dismiss keyboard
        messagesTableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        loadConversation()
        
        //Scroll to bottom of messages
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.messagesTableView.scrollToRow(at: IndexPath(row: self.messagesTableView.numberOfRows(inSection: 0) - 1, section: 0), at: .bottom, animated: false)
        }
    }
    
    
    func loadConversation() {
        //TODO: Get conversation with conversationID
        
        //Test conversation
        conversation = Conversation()
        conversation?.messages = [
            Conversation.Message(text: "I'm really just trying to fill out this TableView so I can get the animations right."),
            Conversation.Message(text: "But I'm not going to test the sent messages yet because I still have to write some code for those."),
            Conversation.Message(text: "This is a very one-sided conversation, if I do say so myself."),
            Conversation.Message(text: "The messages view must be tested!"),
            Conversation.Message(text: "More messages, please."),
            Conversation.Message(text: "Dashing through the snow in a one-horse open sleigh, over the hills we go, laughing all the way. Bells on bobtail ring, making spirits bright. What fun it is to ride and sing a sleighing song tonight!"),
            Conversation.Message(text: "How much wood could a woodchuck chuck if a woodchuck could chuck wood?"),
            Conversation.Message(text: "Is anybody out there?"),
            Conversation.Message(text: "Hello!")
        ]
    }
    
    
    func messageShouldDisplayAsSent(message: Conversation.Message) -> Bool {
        //TODO: Return true if the message was sent by the user
        return false
    }
    
    func messageShouldShowThanks(message: Conversation.Message) -> Bool {
        //TODO: Message should display "Thanks!" indicator if:
        // - Message was received from a college student
        // - User is a college student and message was given Thanks
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if conversation != nil {
            return (conversation?.messages.count)!
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let message = conversation?.messages[(conversation?.messages.count)! - 1 - indexPath.row] {
            var cell: MessageTableViewCell? = nil
            
            if messageShouldDisplayAsSent(message: message) {
                cell = messagesTableView.dequeueReusableCell(withIdentifier: "sentMessage", for: indexPath) as? MessageTableViewCell
            }
            else {
                cell = messagesTableView.dequeueReusableCell(withIdentifier: "receivedMessage", for: indexPath) as? MessageTableViewCell
            }
            
            if cell != nil {
                cell?.setThanksVisible(messageShouldShowThanks(message: message))
                cell?.setMessage(message)
                
                return cell!
            }
        }
        
        return UITableViewCell()    //default to blank cell
    }
    
    
    func keyboardWillShow(notification: Notification) {
        //Shift entire view up above keyboard
        //Also take into account the tab bar height
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height {
            if let tabBarHeight = self.tabBarController?.tabBar.frame.size.height {
                messageEntryBar.frame.origin.y = messageEntryBarOriginalY - (keyboardHeight - tabBarHeight)
                messagesTableView.frame.size.height = messagesTableViewOriginalHeight - (keyboardHeight - tabBarHeight)
            }
            else {
                messageEntryBar.frame.origin.y = messageEntryBarOriginalY - keyboardHeight
                messagesTableView.frame.size.height = messagesTableViewOriginalHeight - keyboardHeight
            }
            
            //Scroll to bottom of messages after shifting view
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.messagesTableView.scrollToRow(at: IndexPath(row: self.messagesTableView.numberOfRows(inSection: 0) - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
