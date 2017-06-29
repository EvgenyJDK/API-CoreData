//
//  CoreDataService.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataService  {
    
    var wordEntities = [NSManagedObject]()
    var wordsListMOC = [NSManagedObject]()
    lazy var managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    func saveNounSynonyms(response: NounType, keyword: String) {
        
        let checkList = getSearchList()
        
        checkForExistInStorage (checkList, wordType: response.type, keyword: keyword) { [weak self] (itemExist) in
            
            if (itemExist) {
                print("Such Noun Already exists")
            } else {
                
                let entity = NSEntityDescription.entityForName("WordEntity", inManagedObjectContext: self!.managedContext)
                let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self!.managedContext)
                
                item.setValue(keyword, forKey: "keyword")
                item.setValue(response.type, forKey: "wordType")
                item.setValue(response.synonyms, forKey: "synonyms")
                
                do {
                    try self!.managedContext.save()
                    print("saved Noun to CD")
                }
                catch {
                    print("Error Can't save to CD")
                }
            }
        }
    }
    
    
    func saveVerbSynonyms(response: VerbType, keyword: String) {
        
        let checkList = getSearchList()
        
        checkForExistInStorage (checkList, wordType: response.type, keyword: keyword) { [weak self] (itemExist) in
            
            if (itemExist) {
                print("Such Verb Already exists")
            } else {
                
                let entity = NSEntityDescription.entityForName("WordEntity", inManagedObjectContext: self!.managedContext)
                let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self!.managedContext)
                
                item.setValue(keyword, forKey: "keyword")
                item.setValue(response.type, forKey: "wordType")
                item.setValue(response.synonyms, forKey: "synonyms")
                
                do {
                    try self!.managedContext.save()
                    print("saved Verb to CD")
                }
                catch {
                    print("Error Can't save to CD")
                }
            }
        }
    }


    func checkForExistInStorage (checkList: [NSManagedObject], wordType: String, keyword: String, callback: (Bool)->()) {
        
        guard checkList.count != 0 else {
            return callback(false)
        }
        
        for i in 0...checkList.count-1 {
            if ((checkList[i].valueForKey("keyword") as? String) == keyword) && ((checkList[i].valueForKey("wordType") as? String) == wordType) {
                callback(true)
                break
            }
            else if i == checkList.count-1 {
                callback(false)
            }
        }
    }

    
    func getSearchList() -> [NSManagedObject] {
    
        let fetchRequest = NSFetchRequest(entityName: "WordEntity")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            wordsListMOC = results as! [NSManagedObject]
        }
        catch {
            print("fetch error")
        }
        return wordsListMOC
    }
    
    
    
    func getWordEntity(keyword: String) -> [NSManagedObject] {
        
        let fetchRequest = NSFetchRequest(entityName: "WordEntity")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            wordsListMOC = results as! [NSManagedObject]
        }
        catch {
            print("fetch error")
        }

        wordEntities = []
        for item in wordsListMOC {
            if item.valueForKey("keyword") as! String == keyword {
                wordEntities.append(item)
            }
        }
        return wordEntities
    }
    
}