//
//  HistoryViewController.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UITableViewController {
    
    
    let arr = ["dvdvd", "eggrbrbf", "353533", "76768u6756", "dvdvd", "eggrbrbf", "353533", "76768u6756"]
    
    override func viewDidLoad() {
        
    }
    
    
 // MARK: - TableView DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell")! as UITableViewCell
        
     
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
        
    }

    
    
 // MARK: - TableView Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        self.performSegueWithIdentifier("showSynonyms", sender: indexPath)
        
    }
    
    
    
    
}