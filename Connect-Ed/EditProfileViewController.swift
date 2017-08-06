//
//  EditProfileViewController.swift
//  Connect-Ed
//
//  Created by mac on 7/19/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class EditProfileViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        ConnectEdDBDelegate.updateProfile(name: nameTextField.text ?? "", school: schoolTextField.text ?? "", major: majorTextField.text ?? "", state: stateTextField.text ?? "", city: cityTextField.text ?? "")
        
        dismiss(animated: true, completion: nil)
    }
}
