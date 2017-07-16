//
//  FavoritesViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/14/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var favoritePeople: [Student] = []
    var favoriteSchools: [School] = []
    
    
    @IBOutlet weak var favoritesListControl: UISegmentedControl!

    @IBOutlet weak var favoritesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTable.dataSource = self
        favoritesTable.delegate = self
        
        favoritesSelectionChanged(self)
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch favoritesListControl.selectedSegmentIndex {
        case 0:
            return favoritePeople.count
            
        case 1:
            return favoriteSchools.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        
        switch favoritesListControl.selectedSegmentIndex {
        case 0:
            cell.setStudent(favoritePeople[indexPath.row])
            
        case 1:
            cell.setSchool(favoriteSchools[indexPath.row])
            
        default:
            break
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    @IBAction func favoritesSelectionChanged(_ sender: Any) {
        switch favoritesListControl.selectedSegmentIndex {
        case 0:
            loadFavoritePeople()
            
        case 1:
            loadFavoriteSchools()
            
        default:
            break
        }
        
        favoritesTable.reloadData()
    }
    
    
    func loadFavoritePeople() {
        //TODO: populate favoritePeople list
        
        //Test students
        favoritePeople = [
            Student(name: "Diana", school: "South Dakota State University", major: "Psychology", state: "South Dakota", city: "Mitchell", profilePic: #imageLiteral(resourceName: "Diana")),
            Student(name: "Emily", school: "Duke University", major: "Biology/Chemistry", state: "Florida", profilePic: #imageLiteral(resourceName: "Emily")),
            Student(name: "Francesca", school: "Eastern New Mexico University", major: "Undecided", state: "New Mexico", profilePic: #imageLiteral(resourceName: "Francesca"))
        ]
    }
    
    func loadFavoriteSchools() {
        //TODO: populate favoriteSchools list
        
        //Test Schools
        favoriteSchools = [
            School(name: "University of California Sunnydale", state: "California", city: "Sunnydale"),
            School(name: "Blue Mountain State University", state: "Pennsylvania"),
            School(name: "Georgetown University", state: "DC", city: "Washington")
        ]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
