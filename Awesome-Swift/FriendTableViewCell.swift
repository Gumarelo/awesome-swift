//
//  FriendTableViewCell.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 19/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
         photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
