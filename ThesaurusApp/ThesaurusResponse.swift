//
//  ThesaurusResponse.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

class  ThesaurusResponse: Mappable {
    

//    var noun: [String: Word]?
//    var verb: [String: Word]?

    var noun: Word?
    var verb: Word?
    
//    var synonymList: [Word]?
//    var syn: [String]?
//    var noun: Noun?
    
    required init?(_ map: Map) {
        
    }
    
    
    func mapping(map: Map) {

        noun <- map["noun"]
        verb <- map["verb"]
//        syn <- map ["syn"]
    }
    
}