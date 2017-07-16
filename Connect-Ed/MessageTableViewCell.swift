//
//  MessageTableViewCell.swift
//  Connect-Ed
//
//  Created by mac on 6/25/17.
//  Copyright © 2017 Connect-Ed. All rights reserved.
//

import UIKit



class MessageTableViewCell: UITableViewCell {
    var message: Conversation.Message? = nil
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var thanksButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        thanksButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.thanksTapped)))
        
        setThanksVisible(false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setMessage(_ message: Conversation.Message) {
        self.message = message
        
        messageLabel.text = message.text
        updateThanksIndicator()
    }
    
    func setThanksVisible(_ visible: Bool) {
        thanksButton.isHidden = !visible
    }
    
    func updateThanksIndicator() {
        if self.message != nil {
            if (self.message?.hasThanks)! {
                thanksButton.setTitleColor(.blue, for: .normal)
            }
            else {
                thanksButton.setTitleColor(.lightGray, for: .normal)
            }
        }
    }
    
    @IBAction func thanksTapped(_ sender: Any?) {
        self.message?.setThanks(!(self.message?.hasThanks)!)
        updateThanksIndicator()
    }
}
