//
//  ThesaurusResponse.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

//class  ThesaurusResponse: Mappable {
//
//    var noun: Word?
//    var verb: Word?
//    
//    required init?(_ map: Map) {
//    }
//    
//    func mapping(map: Map) {
//        noun <- map["noun"]
//        verb <- map["verb"]
//    }
//}


//struct  ThesaurusResponse: Mappable {
//    
//    var noun: Word?
//    var verb: Word?
//    
//    init?(_ map: Map) {
//    }
//    
//    mutating func mapping(map: Map) {
//        noun <- map["noun"]
//        verb <- map["verb"]
//    }
//}



//struct  ThesaurusResponse: Mappable {
//    
//    var noun: String?
//    var verb: String?
//    
//    var nounSynonum: [String]?
//    var verbSynonum: [String]?
//    
//    init?(_ map: Map) {
//    }
//    
//    mutating func mapping(map: Map) {
//        noun <- map["noun"]
//        verb <- map["verb"]
//        nounSynonum <- map ["noun.syn"]
//        verbSynonum <- map ["verb.syn"]
//    }
//}



struct  ThesaurusResponse: Mappable {

        var noun: WordType?
        var verb: WordType?
    
//    var wordType: WordType?
    
    init?(_ map: Map) {
    }

    mutating func mapping(map: Map) {
        
        noun <- map["noun"]
        verb <- map["verb"]
        
//        wordType <- map ["verb"]
//        wordType <- map ["noun"]

        
        
    }
}

