//
//  Resources.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 4/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class Resources {
    //MARK: properties
    
    var name: String
    var explanation: String
    var rating: Int
    
    //MARK: initialization
    init?(name:String, explanation:String,  rating:Int){
        // Initialize stored properties.
        self.name = name
        self.explanation = explanation
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
