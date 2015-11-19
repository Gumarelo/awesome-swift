//
//  TestViewController.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 19/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var texLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
