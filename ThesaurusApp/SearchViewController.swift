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


    override func viewDidLoad() {
        
        searchWordBar.delegate = self
        synonymTableView.dataSource = self
        synonymTableView.delegate = self
   
        
    }
    
    
    
// MARK: - SearchBar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    
    
    
 // MARK: - TableView Datasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let synonymCell = tableView.dequeueReusableCellWithIdentifier("SynonymCell") as! SynonymCell
        
        return synonymCell
    }
    
    
    
// MARK: - TableView Datasource
    
    
    
}