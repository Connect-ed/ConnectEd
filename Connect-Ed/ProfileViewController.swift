//
//  ProfileViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/14/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        ConnectEdDBDelegate.populateProfileView(self, userId: ConnectEdDBDelegate.getSignedInStudentId())
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
