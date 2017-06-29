//
//  VerbType.swift
//  ThesaurusApp
//
//  Created by Administrator on 28.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

struct VerbType: Mappable {
    
    let type = "Verb"
    var synonyms: [String]?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        synonyms <- map ["syn"]
    }
    
}