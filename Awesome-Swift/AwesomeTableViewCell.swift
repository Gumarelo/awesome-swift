//
//  AwesomeTableViewCell.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 4/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class AwesomeTableViewCell: UITableViewCell {
    
    //MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
