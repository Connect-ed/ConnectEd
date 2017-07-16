//
//  SearchResultsViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/15/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class SearchResultsViewController: UITableViewController {
    var searchResults: [Student] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
            
        //resultCell.student = searchResults[indexPath.row]
        
        resultCell.setStudent(searchResults[indexPath.row])
        
        return resultCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
