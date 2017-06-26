//
//  APIService.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

class  ApiService  {

    
    func getSynonyms(inputText: String, callback: (ThesaurusResponse?, ApiError?) -> Void) {

        let searchRequest = "\(GlobalConstants.urlRequest)/\(inputText)/\(GlobalConstants.format)"
        
        Alamofire.request(.GET, searchRequest).responseObject {
            (response: Response<ThesaurusResponse, NSError>) in
            
            let searchSynonymResults = response.result.value
            
            print(searchSynonymResults?.noun?.synonyms?.count)
            for item in (searchSynonymResults?.noun?.synonyms)! {
                print(item)
            }
            for item in (searchSynonymResults?.verb?.synonyms)! {
                print(item)
            }
            
            callback(searchSynonymResults, nil)
        }

        
//        Alamofire.request(.GET, searchRequest).responseJSON { response in
//            
//            guard let json = response.result.value as? [String: AnyObject] else {
//                return
//            }
//            
//            print(json)
//            
////            let item = ThesaurusResponse(JSON: <#T##[String : AnyObject]#>)
////            
////            print(item)
//            
//            
////            if let value = response.result.value {
//            
////                let json = JSON(value)
////                
////                print(json["firstkey"].stringValue)
////                print(json["secondkey"].arrayValue)
////                print(json["secondkey"][1].stringValue)
////            
////            let item = ThesaurusResponse(JSON: ["noun" : AnyObject])
////            let item = ThesaurusResponse(JSON: ["verb" : AnyObject])
//            
////            }
//
//            
//            
//            
////            for key in json.keys {
////                print(key)
////                let item = ThesaurusResponse(JSON: [key : json[key]!])
////                print("noun = \(item?.noun?["syn"]!.count)")
////                 print("verb = \(item?.verb?["syn"]!.count)")
////            }
//            
//            
//
////            let item = ThesaurusResponse(JSON: [String : AnyObject])
//            
//            
//            
////            if let noun = json["noun"] as? [String: AnyObject] {
////                let item = ThesaurusResponse(J)
////            }
//   
//            
//            
//            
//            
//            
///*
//            if let noun = json["noun"] as? [String: AnyObject] {
//                if let syn = noun["syn"] as? [String] {
//                    let item = ThesaurusResponse(JSON: ["syn" : syn])
//                    callback(item, nil)
//                }
//            }
//            if let verb = json["verb"] as? [String: AnyObject] {
//                if let syn = verb["syn"] as? [String] {
//                    let item = ThesaurusResponse(JSON: ["syn" : syn])
//                    callback(item, nil)
//                }
//            }
//*/
//            
//            
//            
//            
//        }
        
    }
    
}

