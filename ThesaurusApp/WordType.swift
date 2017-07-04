//
//  WordType.swift
//  ThesaurusApp
//
//  Created by Administrator on 29.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

struct WordType: Mappable {
    
    let type = "Noun"
    var synonyms: [String]?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        synonyms <- map ["syn"]
    }

}