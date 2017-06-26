//
//  Word.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

class  Word: Mappable {
    
    var synonyms: [String]?
    var antonyms: [String]?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        
        synonyms <- map ["syn"]
//        antonyms <- map ["ant"]
    }
    
}