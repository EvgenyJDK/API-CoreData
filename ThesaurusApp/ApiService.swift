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


class  ApiService  {

    
    func getSynonyms(inputText: String, callback: (ThesaurusResponse?, ApiError?, String?) -> Void) {

        let searchRequest = "\(Constants.urlRequest)/\(inputText)/\(Constants.format)"
        
        Alamofire.request(.GET, searchRequest).responseJSON { response in
            
            if let json = response.result.value as? [String: AnyObject] {
                let item = ThesaurusResponse(JSON: json)
                callback(item, nil, inputText)
            }
        }
    }
}

