//
//  Word.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

//class  Word: Mappable {
//    
//    var synonyms: [String]?
//    var antonyms: [String]?
//    
//    required init?(_ map: Map) {
//    }
//    
//    func mapping(map: Map) {
//        
//        synonyms <- map ["syn"]
////        antonyms <- map ["ant"]
//    }
//  
//}


//struct  Word: Mappable {
//    
//    var synonyms: [String]?
//    var antonyms: [String]?
//    
//    init?(_ map: Map) {
//    }
//    
//    mutating func mapping(map: Map) {
//        
//        synonyms <- map ["syn"]
//        //        antonyms <- map ["ant"]
//    }
//    
//}



struct  Word: Mappable {

//    var name: String?
    
    var synonyms: [String]?
//    var antonyms: [String]?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
         synonyms <- map ["syn"]
        
//        name <- map ["noun"]
//        synonyms <- map ["\(name).syn"]
        //        antonyms <- map ["ant"]
    }
    
}


