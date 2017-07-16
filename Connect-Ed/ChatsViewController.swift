//
//  ChatsViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/14/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class ChatsViewController: UITableViewController {
    var chats: [Student] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadChats()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openChat", sender: chats[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = chats[indexPath.row].name
        //TODO: Get last message
        cell.detailTextLabel?.text = "<Last Message>"
        cell.imageView?.image = chats[indexPath.row].profilePic
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let chatViewController = segue.destination as! ChatViewController
        
        if let student = sender as! Student? {
            chatViewController.conversationID = getConversationID(forStudent: student)
            chatViewController.title = student.name
        }
    }
    
    
    func loadChats() {
        //TODO
        
        //Test students:
        chats = [
            Student(name: "Gloria", school: "Penn State University", major: "Economics", state: "New Jersey", profilePic: #imageLiteral(resourceName: "Gloria")),
            Student(name: "Hannah", school: "Villanova University", major: "Mathematics", state: "Pennsylvania", city: "Philadelphia", profilePic: #imageLiteral(resourceName: "Hannah")),
            Student(name: "Isaac", school: "College of New Jersey", major: "Economics", state: "Pennsylvania", profilePic: #imageLiteral(resourceName: "Isaac"))
        ]
    }
    
    func getConversationID(forStudent: Student) -> u_long {
        //TODO
        return 0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
