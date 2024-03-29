//
//  PersistenceManager.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/30.
//

import UIKit
import CoreData

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SavedColorMO")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {
        let center = NotificationCenter.default
        let notification = UIApplication.willResignActiveNotification
        
        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            
            if self.persistentContainer.viewContext.hasChanges {
                try? self.persistentContainer.viewContext.save()
            }
        }
    }
    
    func insert(color: SavedColorMO) {
        persistentContainer.viewContext.insert(color)
    }
    
    func save() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
                print("In CoreData.stack.save()")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func delete(color: SavedColorMO) {
        persistentContainer.viewContext.delete(color)
    }
    
    func printColors() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedColorMO")
        do {
            let colors = try persistentContainer.viewContext.fetch(fetchRequest) as! [SavedColorMO]
            for color in colors {
                print("\(color.id), \(color.hex)")
            }
        } catch let error as NSError {
            print(error)
        }
    }
}
