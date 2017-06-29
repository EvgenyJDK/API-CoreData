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
    var type: String!
    var synonyms: [String]!
    
    init (object: NSManagedObject) {
        
        self.titleWord = object.valueForKey("keyword") as? String
        self.type = object.valueForKey("wordType") as? String
        self.synonyms = object.valueForKey("synonyms") as? [String]
        
    }

}
