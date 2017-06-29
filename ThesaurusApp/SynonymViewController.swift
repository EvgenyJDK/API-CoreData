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

    var synonymWords = [Synonym]()

    
    override func viewDidLoad() {
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return synonymWords.count
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return synonymWords[section].synonyms.count
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return synonymWords[section].type
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let synonymCell = tableView.dequeueReusableCellWithIdentifier("SynonymCell")! as UITableViewCell
        
        synonymCell.textLabel?.text = synonymWords[indexPath.section].synonyms[indexPath.row]

        return synonymCell
    }
    
    
}
