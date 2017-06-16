//
//  SearchResultsViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/15/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var searchResults: [Student] = []
    
    @IBOutlet weak var searchResultsTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultsTable.dataSource = self
        searchResultsTable.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = UITableViewCell()
        
        resultCell.textLabel?.text = searchResults[indexPath.row].name
        
        return resultCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
