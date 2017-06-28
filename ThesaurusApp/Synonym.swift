//
//  SynonymWord.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import CoreData

struct Synonym {
    
    var titleWord: String!
    
    init (object: NSManagedObject) {
        
        self.titleWord = object.valueForKey("titleWord") as? String
    }

}
