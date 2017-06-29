//
//  WordType.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

/*
struct WordType: Mappable {
    
    var type: [String]?
    var synonyms: [String]?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        synonyms <- map ["syn"]
    }
}
*/


struct WordType: Mappable {
    
    var synonyms: [String]?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        synonyms <- map ["syn"]
    }
}
