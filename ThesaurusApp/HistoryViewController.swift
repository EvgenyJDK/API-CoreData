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
    

    var searchListMOC = [NSManagedObject]()
    var searchHistory = [String]()

    override func viewDidLoad() {
        
        sortSearchList(searchListMOC)
        self.tableView.reloadData()
    }
    
    
    func sortSearchList(searchListMOC: [NSManagedObject]) {
        
        var set = Set<String>()
        for item in searchListMOC {
            set.insert(item.valueForKey("keyword") as! String)
        }
        searchHistory = set.sort({ $0 < $1 })
    }
    
    
 // MARK: - TableView DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchHistory.count ?? 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell")! as UITableViewCell
        cell.textLabel?.text = searchHistory[indexPath.row]
        return cell
    }

    
    
 // MARK: - TableView Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showSynonyms", sender: indexPath)
    }
    
    
    
// MARK: - Navigation. Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var segueList = [Synonym]()
        for item in searchListMOC {
            if (item.valueForKey("keyword") as! String) == (searchHistory[sender!.row]) {
                segueList.append(Synonym(object: item))
            }
        }
        let synonymController : SynonymViewController = segue.destinationViewController as! SynonymViewController
        synonymController.synonymWords = segueList
    }
    
}