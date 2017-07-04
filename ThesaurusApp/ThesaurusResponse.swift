//
//  ThesaurusResponse.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper


struct  ThesaurusResponse: Mappable {
    
    var noun: NounType?
    var verb: VerbType?
    
//    var nounSynonyms: [String]?
//    var verbSynonyms: [String]?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        noun <- map["noun"]
        verb <- map["verb"]
//        nounSynonyms <- map ["noun.syn"]
//        verbSynonyms <- map ["verb.syn"]
    }
    
}



//struct  ThesaurusResponse: Mappable {
//    
//    let types = ["noun", "verb", "adverb", "adjective"]
////    var noun: [String: Any]?
////    var verb: [String: Any]?
//    var nounSynonyms: [String]?
//    var verbSynonyms: [String]?
//    
//    init?(_ map: Map) {
//    }
//    
//    mutating func mapping(map: Map) {
////        noun <- map["noun"]
////        verb <- map["verb"]
//        nounSynonyms <- map ["noun.syn"]
//        verbSynonyms <- map ["verb.syn"]
//    }
//
//}




