//
//  RatingControl.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 4/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: properties
    var rating = 0 {
        // A property observer observes and responds to changes in a property’s value. Property observers are called every time a property’s value is set, and can be used to perform work immediately before or after the value changes. Specifically, the didSet property observer is called immediately after the property’s value is set. Here, you include a call to setNeedsLayout(), which will trigger a layout update every time the rating changes. This ensures that the UI is always showing an accurate representation of the rating property value.
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    
    var stars = 5
    
    //MARK: Initialization
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped", forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for(index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        
        return CGSize(width: width, height: buttonSize)
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for(index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
}
