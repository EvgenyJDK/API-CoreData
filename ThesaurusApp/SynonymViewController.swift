//
//  SynonymViewController.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit
import Foundation

class SynonymViewController: UITableViewController {

//    var coreDataService = CoreDataService()
    var synonymWords: Synonym?
    
    override func viewDidLoad() {
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return synonymWords.
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let synonymCell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        return synonymCell
        
    }
    
    
}
