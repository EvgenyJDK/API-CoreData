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


class  ApiService  {

    
    func getSynonyms(inputText: String, callback: (ThesaurusResponse?, ApiError?) -> Void) {

        let searchRequest = "\(GlobalConstants.urlRequest)/\(inputText)/\(GlobalConstants.format)"
        
//        Alamofire.request(.GET, searchRequest).responseObject {
//            (response: Response<ThesaurusResponse, NSError>) in
//            
//            if let searchSynonymResults = response.result.value {
//                callback(searchSynonymResults, nil)
//            }
//        }
      
        
        Alamofire.request(.GET, searchRequest).responseJSON { response in
            
            if let json = response.result.value as? [String: AnyObject] {
                let item = ThesaurusResponse(JSON: json)
                callback(item, nil)
            }
        }
    }

    
}

