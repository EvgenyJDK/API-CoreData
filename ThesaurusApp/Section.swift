//
//  Section.swift
//  ThesaurusApp
//
//  Created by Administrator on 26.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation

enum Section: String {
    case Noun = "Noun"
    case Verb = "Verb"
    
    static var numberOfSections: Int {return 2}
}



//enum Section: Int {
//    case Noun
//    case Verb
//    
//    init?(indexPath: NSIndexPath) {
//        self.init(rawValue: indexPath.section)
//    }
//    
//    static var numberOfSections: Int { return 2 }
//}



