//
//  FinderViewController.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchWordBar: UISearchBar!
    @IBOutlet weak var synonymTableView: UITableView!

    let apiService = ApiService()
    let coreDataService = CoreDataService()
    
    var timer: NSTimer? = nil
    var wordListMOC = [NSManagedObject]()
//    var searchListMOC: [NSManagedObject]!
    
    override func viewDidLoad() {
        
        searchWordBar.delegate = self
        synonymTableView.dataSource = self
        synonymTableView.delegate = self
        
    }
    
    
    
// MARK: - SearchBar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(
            0.5,
            target: self,
            selector: #selector(SearchViewController.sendRequest),
            userInfo: searchText,
            repeats: false)
    }
    
    
    func sendRequest(timer: NSTimer) {
        
        let searchText = timer.userInfo as! String
        
        if searchText == "" {
            wordListMOC = []
            synonymTableView.reloadData()
        } else {
            apiService.getSynonyms(searchText) { (response, error, keyword) in
                
                if let nounSynonyms = response?.noun {
                    self.coreDataService.saveNounSynonyms(nounSynonyms, keyword: keyword!)
                }
                if let verbSynonyms = response?.verb {
                    self.coreDataService.saveVerbSynonyms(verbSynonyms, keyword: keyword!)
                }
                self.wordListMOC = self.coreDataService.getWordEntityOnDemand(keyword!)
                self.synonymTableView.reloadData()
            }
        }
    }
 
    
    
    
    func fetch() {
        
        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let moc = appDelegate.dataController.managedObjectContext
//        
////        let tagsVC = segue.destinationViewController as! TagsTableViewController
//        
//        let request = NSFetchRequest(entityName: "WordEntity")
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//        
////        tagsVC.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        
        
    }


    
    
    
 // MARK: - TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return wordListMOC.count ?? 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordListMOC[section].valueForKey("synonyms")?.count ?? 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return wordListMOC[section].valueForKey("wordType") as? String ?? ""
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let synonymCell = tableView.dequeueReusableCellWithIdentifier("SynonymCell") as! SynonymCell
        
        synonymCell.itemLabel.text = wordListMOC[indexPath.section].valueForKey("synonyms")![indexPath.row] as? String
        
        return synonymCell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        if segue.identifier == "showSearchHistory" {
//            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            let moc = appDelegate.dataController.managedObjectContext
//            
//            let historyVC = segue.destinationViewController as! HistoryViewController
//            
//            let request = NSFetchRequest(entityName: "WordEntity")
//            request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//            
//            historyVC.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
//            
//        }

    }
    
    
}