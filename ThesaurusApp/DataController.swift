//
//  DataController.swift
//  ThesaurusApp
//
//  Created by Administrator on 27.06.17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    
//    let managedObjectContext: NSManagedObjectContext
//    
//    init (moc: NSManagedObjectContext) {
//        self.managedObjectContext = moc
//    }
//    
//    
//    
//    convenience init?() {
//        
//        guard let modelURL = NSBundle.mainBundle().URLForResource("ThesaurusApp", withExtension: "momd") else {
//            return nil
//        }
//        
//        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
//            return nil
//        }
//        
//        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
//        let moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
//        moc.persistentStoreCoordinator = psc
//        
//        
//        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
//        let persistantStoreFileURL = urls[0].URLByAppendingPathComponent("Thesaurus.sqlite")
//        
//        do {
//            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: persistantStoreFileURL, options: nil)
//        } catch {
//            fatalError("Error adding store!")
//        }
//        
//        self.init(moc: moc)
//    }

    
    
/*
    func saveWordEntity(wordTitle: String, wordItem: ThesaurusResponse) {
        
        let wordsFetch = NSFetchRequest(entityName: "WordEntity")
        wordsFetch.predicate = NSPredicate(format: "title == %@", wordTitle)
        
        var fetchedWords: [WordEntity]!
        do {
            fetchedWords = try self.managedObjectContext.executeFetchRequest(wordsFetch) as! [WordEntity]
        } catch {
            fatalError("fetch failed")
        }
        
        var word: WordEntity
        if fetchedWords.count == 0 {
            word = NSEntityDescription.insertNewObjectForEntityForName("WordEntity", inManagedObjectContext: self.managedObjectContext) as! WordEntity
            word.title = wordTitle
        } else {
            word = fetchedWords[0]
        }
        
        
        
        if let nounType = wordItem.noun?.type {
            let newWordType = NSEntityDescription.insertNewObjectForEntityForName("WordTypeEntity", inManagedObjectContext: self.managedObjectContext) as! WordTypeEntity
            newWordType.typeValues = nounType
        }
        
        if let verbType = wordItem.verb?.type {
            let newWordType = NSEntityDescription.insertNewObjectForEntityForName("WordTypeEntity", inManagedObjectContext: self.managedObjectContext) as! WordTypeEntity
            newWordType.typeValues = verbType
        }
        
        //        let newImage = NSEntityDescription.insertNewObjectForEntityForName("Image", inManagedObjectContext: self.managedObjectContext) as! Image
        //
        //        newImage.title = feedItem.title
        //        newImage.imageURL = feedItem.imageURL.absoluteString
        //        /* we've associated the image and the tag together */
        //        newImage.tag = tag
        
        do {
            try self.managedObjectContext.save()
            print("SAVED")
        } catch {
            fatalError("couldn't save context")
        }

    }
*/
    
        
    
    
}