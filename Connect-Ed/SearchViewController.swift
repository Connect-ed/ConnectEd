//
//  SearchViewController.swift
//  Connect-Ed
//
//  Created by mac on 6/14/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    var entryTextFields: [UITextField] = []
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        entryTextFields = [
            collegeTextField,
            majorTextField,
            cityTextField,
            stateTextField
        ]
        
        //Set all text field delegates to self to override Return key
        for textField in entryTextFields {
            textField.delegate = self
            textField.returnKeyType = .next
        }
        
        //Set final return key to Go instead of Next
        entryTextFields.last?.returnKeyType = .go
    }
    
    
    @IBAction func search(_ sender: Any) {
        //TODO: search function
        
        performSegue(withIdentifier: "showSearchResults", sender: self)
    }
    
    
    // Move to next field by pressing return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == entryTextFields.last {
            search(sender: self)
        }
        else {
            var textFieldIterator = entryTextFields.makeIterator()
            
            while textField != textFieldIterator.next() {}
            
            textFieldIterator.next()?.becomeFirstResponder()
        }
        
        
        return true
    }
    
    // Dismiss keyboard by touching outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
