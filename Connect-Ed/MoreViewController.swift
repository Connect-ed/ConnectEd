//
//  MoreViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/14/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class MoreViewController: UITableViewController {
    struct CellProperties {
        var title: String
        var image: UIImage?
        var style: UITableViewCellStyle
        var accessory: UITableViewCellAccessoryType
    }
    
    //TODO: Add support for translations
    //And don't forget about the "Chat Credits:" in tableView(cellForRowAt)
    let cellSections: [[CellProperties]] = [
        [
            CellProperties(title: "Chat Credits:", image: #imageLiteral(resourceName: "photo"), style: .value1, accessory: .none),
            CellProperties(title: "Purchase Credits", image: #imageLiteral(resourceName: "photo"), style: .default, accessory: .disclosureIndicator)
        ],
        [
            CellProperties(title: "Invite Friends", image: #imageLiteral(resourceName: "photo"), style: .default, accessory: .none)
        ],
        [
            CellProperties(title: "Notifications", image: #imageLiteral(resourceName: "photo"), style: .default, accessory: .disclosureIndicator),
            CellProperties(title: "Preferences", image: #imageLiteral(resourceName: "photo"), style: .default, accessory: .disclosureIndicator),
            CellProperties(title: "Get Help", image: #imageLiteral(resourceName: "photo"), style: .default, accessory: .detailButton),
        ]
    ]

    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Remove the empty rows at the end of the table
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cellSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Add 1 for the empty cell divider
        return cellSections[section].count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            //Start each section with an empty cell to divide them
            let cell = UITableViewCell()
            
            cell.backgroundColor = tableView.backgroundColor
            cell.selectionStyle = .none
            
            return cell
        }
        else {
            let cell = UITableViewCell(style: cellSections[indexPath.section][indexPath.row - 1].style, reuseIdentifier: "cell")
        
            cell.textLabel?.text = cellSections[indexPath.section][indexPath.row - 1].title
            cell.imageView?.image = cellSections[indexPath.section][indexPath.row - 1].image
            cell.accessoryType = cellSections[indexPath.section][indexPath.row - 1].accessory
            
            //Special case for Chat Credits cell
            if cellSections[indexPath.section][indexPath.row - 1].title == "Chat Credits:" {
                //TODO: Add functionality to chat credits display
                cell.detailTextLabel?.text = "0";
            }
        
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
