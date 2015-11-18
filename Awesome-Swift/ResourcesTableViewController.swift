//
//  ResourcesTableViewController.swift
//  Awesome-Swift
//
//  Created by Jorge Casariego on 4/11/15.
//  Copyright © 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class ResourcesTableViewController: UITableViewController {
    
    // MARK: properties
    var resources = [Resources]()
    var identifier: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the resources
        loadResources()
    }
    
    func loadResources(){
        let resources1 = Resources(name: "Reachability", explanation: "Replacement for Apple's Reachability re-written in Swift with closures", rating: 5)!

        resources += [resources1]
        
        let resources2 = Resources(name: "Splitflap", explanation: "A simple split-flap display for your Swift applications", rating: 5)!
        
        resources += [resources2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resources.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "AwesomeTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AwesomeTableViewCell
        
        let resource = resources[indexPath.row]

        cell.nameLabel.text = resource.name
        cell.explanationLabel.text = resource.explanation
        cell.ratingControl.rating = resource.rating
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         print("You selected cell #\(segue.identifier)!")
        
        /*if segue.identifier == "ReachabilitySegue" {
            print("Reach")
            self.identifier = "ReachabilitySegue"
        } else if segue.identifier == "SplitflapSegue" {
            print("Spit")
            self.identifier = "SplitflapSegue"
        }*/
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let go = resources[indexPath.row].name
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if go == "Reachability" {
            performSegueWithIdentifier("ReachabilitySegue", sender: self)
        } else if go == "Splitflap" {
            performSegueWithIdentifier("SplitflapSegue", sender: self)
        }
        

        
    }
    

}
