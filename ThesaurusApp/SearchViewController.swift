//
//  FinderViewController.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchWordBar: UISearchBar!
    @IBOutlet weak var synonymTableView: UITableView!

    let apiService = ApiService()
    let coreDataService = CoreDataService()
    var timer: NSTimer? = nil
    
    
    let arr = ["dvdvd", "eggrbrbf", "353533", "76768u6756", "dvdvd", "eggrbrbf", "353533", "76768u6756"]
    var noun = []
    var verb = []
    var array = [Word]()
    
    
    
    var sections: [String] = []
    
    override func viewDidLoad() {
        
        searchWordBar.delegate = self
        synonymTableView.dataSource = self
        synonymTableView.delegate = self
   
        
    }
    
    
    
// MARK: - SearchBar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(
            0.7,
            target: self,
            selector: #selector(SearchViewController.sendRequest),
            userInfo: searchText,
            repeats: false)
    }
    
    
    func sendRequest(timer: NSTimer) {
        let searchText = timer.userInfo as! String
//        coreDataService.saveSearch(searchText)
        apiService.getSynonyms(searchText) { (response, error, text) in
            
            if let syn = response {

                if let nounSyn = syn.noun?.synonyms {
                    self.noun = nounSyn
                    self.sections.append("noun")
                }
                if let verbSyn = syn.verb?.synonyms {
                    self.sections.append("verb")
                    self.verb = verbSyn
                }

                
//                print(syn.sectionName?.count)
//                print(syn.sectionName)
//                print("KEYS = \(syn.sectionName?.keys)")
//                print("NOUN = \(syn.noun)")
//                print("VERB = \(syn.verb)")
                
                
//                print(response)
                print("search = \(text)")
//                print("wordType  = \(syn)")
//                print("wordType  = \(syn.verb)")
//                print("wordType NOUN = \(syn.noun)")
//                print("wordType VERB = \(syn.verb)")
                

                
//                let typeVal = ["noun": syn.noun!, "verb": syn.verb!]
//                let model = Model(title: text!, typeValue: typeVal)
//                print("MODEL = \(model)")
//                print("TYPES = \(typeVal)")

//                self.coreDataService.saveModel(model)
                
                
                self.coreDataService.saveWord(syn.noun!)
//                self.coreDataService.getSearchHistory()
                
                self.synonymTableView.reloadData()
            }
            
        }
    }
 
    
    
    
    
 // MARK: - TableView DataSource
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        
//        return Section.numberOfSections
////        return arr.count
//    }
//
//   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        switch Section(rawValue: section) {
//        case .Noun?:    return arr.count
//        case .Verb?: return arr.count
//            
//        case .None:     return 0
//        }
//        print(sections.count)
//        return (sections.count)
        
        return noun.count
    }
   
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print(section)
//        return sections[section]
//    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let synonymCell = tableView.dequeueReusableCellWithIdentifier("SynonymCell") as! SynonymCell
        
        synonymCell.itemLabel.text = noun[indexPath.row] as? String
        
        return synonymCell
    }
    
    
    
// MARK: - TableView Delegate
    
    
    
}