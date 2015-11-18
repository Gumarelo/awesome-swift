//
//  ViewController.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 4/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit
import ReachabilitySwift

let useClosures = false

class ReachabilityViewController: UIViewController {
    
    @IBOutlet weak var networkStatus: UILabel!
    
    var reachability: Reachability?
    
    var delegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        do {
            let reachability = try Reachability.reachabilityForInternetConnection()
            self.reachability = reachability
        } catch
            (let address) {
            networkStatus.textColor = UIColor.redColor()
            networkStatus.text = "Unable to create\nReachability with address:\n\(address)"
            return
        }
        
        if (useClosures) {
            reachability?.whenReachable = { reachability in
                self.updateLabelColourWhenReachable(reachability)
            }
            reachability?.whenUnreachable = { reachability in
                self.updateLabelColourWhenNotReachable(reachability)
            }
        } else {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: ReachabilityChangedNotification, object: reachability)
        }
        
        do {
            try reachability?.startNotifier()
        } catch {
            networkStatus.textColor = UIColor.redColor()
            networkStatus.text = "Unable to start\nnotifier"
            return
        }
        
        // Initial reachability check
        if let reachability = reachability {
            if reachability.isReachable() {
                updateLabelColourWhenReachable(reachability)
            } else {
                updateLabelColourWhenNotReachable(reachability)
            }
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    deinit {
        
        reachability?.stopNotifier()
        
        if (!useClosures) {
            NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: nil)
        }
    }
    
    func updateLabelColourWhenReachable(reachability: Reachability) {
        if reachability.isReachableViaWiFi() {
            self.networkStatus.textColor = UIColor.greenColor()
        } else {
            self.networkStatus.textColor = UIColor.blueColor()
        }
        
        self.networkStatus.text = reachability.currentReachabilityString
    }
    
    func updateLabelColourWhenNotReachable(reachability: Reachability) {
        self.networkStatus.textColor = UIColor.redColor()
        
        self.networkStatus.text = reachability.currentReachabilityString
    }
    
    
    func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability
        
        if reachability.isReachable() {
            updateLabelColourWhenReachable(reachability)
        } else {
            updateLabelColourWhenNotReachable(reachability)
        }
    }
    
    @IBAction func urlPressed(sender: UIButton) {
        let url = NSURL(string: "https://github.com/ashleymills/Reachability.swift")
        if UIApplication.sharedApplication().canOpenURL(url!){
                UIApplication.sharedApplication().openURL(url!)
        }
        
        
    }
}