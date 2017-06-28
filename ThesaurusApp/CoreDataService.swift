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
    
    var wordsListMOC = [NSManagedObject]()
    lazy var managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    func saveSearch(inputWord: String) {
        let entity = NSEntityDescription.entityForName("SearchWord", inManagedObjectContext: self.managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedContext)
        
        item.setValue(inputWord, forKey: "title")
        
        do {
            try self.managedContext.save()
            self.wordsListMOC.append(item)
            print("saved to CD")
        }
        catch {
            print("Error Can't save to CD")
        }
   
        
    }
    
    
    
    func saveWord (inputWord: WordType) {
        
        print("COREDATA = \(inputWord)")
        
        let entity = NSEntityDescription.entityForName("Word", inManagedObjectContext: self.managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedContext)
        
//        print(inputWord.type)
        
//        item.setValue(value: AnyObject?, forKey: "title")
        item.setValue(inputWord.synonyms, forKey: "nounSynonym")

//         item.setValue(recEnt.title, forKey: "recipeTitle")
        
        do {
            try self.managedContext.save()
            self.wordsListMOC.append(item)
            print("saved to CD")
        }
        catch {
            print("Error Can't save to CD")
        }
    }
    
    
    func saveModel (inputModel: Model) {
        
        print("COREDATA = \(inputModel)")
        
        let entity = NSEntityDescription.entityForName("Model", inManagedObjectContext: self.managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedContext)
        
        //        print(inputWord.type)
        
        //        item.setValue(value: AnyObject?, forKey: "title")
        item.setValue(inputModel.title, forKey: "title")
//        item.setValue(inputModel.typeValue, forKey: "typeValue")
        
        //         item.setValue(recEnt.title, forKey: "recipeTitle")
        
        do {
            try self.managedContext.save()
            self.wordsListMOC.append(item)
            print("saved to CD")
        }
        catch {
            print("Error Can't save to CD")
        }
        
        
    }

    
    
    
    
    
    
    
    func getSearchHistory() -> [NSManagedObject] {
    
        let fetchRequest = NSFetchRequest(entityName: "Word")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            wordsListMOC = results as! [NSManagedObject]
        }
        catch {
            print("fetch error")
        }
        
//        print(wordsListMOC[0].valueForKey("synonym"))
        return wordsListMOC
        
    }
    
}