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
    var timer: NSTimer?
    var wordListMOC = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                

                
//                self.coreDataService.saveModel(response!, keyword: keyword!)
                
                if let nounSynonyms = response?.noun {
                    self.coreDataService.saveNounSynonyms(nounSynonyms, keyword: keyword!)
                }
                if let verbSynonyms = response?.verb {
                    self.coreDataService.saveVerbSynonyms(verbSynonyms, keyword: keyword!)
                }
                self.wordListMOC = self.coreDataService.getWordEntity(keyword!)
                self.synonymTableView.reloadData()
            }
        }
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
        
        let synonymCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! SynonymCell
        synonymCell.itemLabel.text = wordListMOC[indexPath.section].valueForKey("synonyms")![indexPath.row] as? String
        return synonymCell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSearchHistory" {
            let historyVC = segue.destinationViewController as! HistoryViewController
            historyVC.searchListMOC = coreDataService.getSearchList()
        }
    }
    
}