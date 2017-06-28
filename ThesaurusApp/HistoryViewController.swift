//
//  HistoryViewController.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class HistoryViewController: UITableViewController {
    
    var coreDataService = CoreDataService()
    var searchListMOC = [NSManagedObject]()
    
    var items: [String] = []
    
    let arr = ["dvdvd", "eggrbrbf", "353533", "76768u6756", "dvdvd", "eggrbrbf", "353533", "76768u6756"]
    
    
    override func viewDidLoad() {
        getPersistentData()
        self.tableView.reloadData()
    }
    
    
    
    func getPersistentData() {
        searchListMOC = coreDataService.getSearchHistory()
        print("getPersistentData = \((searchListMOC[0].valueForKey("nounSynonym")!).count)")
         print("getPersistentData = \((searchListMOC[0].valueForKey("nounSynonym")!).count)")
        
        items = searchListMOC[0].valueForKey("nounSynonym")! as! [String]
        
//        print("getPersistentData = \((searchListMOC[0].valueForKey("title")!).count)")
//        items = searchListMOC[0].valueForKey("title")! as! [String]
        print(searchListMOC)
        
    }

    
    
 // MARK: - TableView DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (searchListMOC[0].valueForKey("nounSynonym")!).count
//        return arr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell")! as UITableViewCell
        
     
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }

    
    
 // MARK: - TableView Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        self.performSegueWithIdentifier("showSynonyms", sender: indexPath)
        
    }
    
    
    
// MARK: - Navigation. Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print ([sender!.row])
        
//        let segueItem = Synonym(object: searchListMOC[sender!.row]) // no good
//        let synonymController : SynonymViewController = segue.destinationViewController as! SynonymViewController
//        synonymController.synonymWords = segueItem
        
    }

    
    
    
    
}