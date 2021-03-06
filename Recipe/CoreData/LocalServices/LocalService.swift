//
//  LocalService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import CoreData
import UIKit

protocol LocalServiceProtocol {
    var context: NSManagedObjectContext { get }

    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T]
    func save() throws
    func delete(_ object: NSManagedObject) throws
}

class LocalService: LocalServiceProtocol {
    static let modelName = "Model"

    static let model: NSManagedObjectModel = {
      let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")!
      return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var context: NSManagedObjectContext = {
      return persistentContainer.viewContext
    }()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: LocalService.modelName, managedObjectModel: LocalService.model)
        container.loadPersistentStores { _, error in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        }
        return container
    }()

    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let result = try context.fetch(fetchRequest) as? [T]
            return result ?? []
        } catch {
            return []
        }
    }

    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }

    func delete(_ object: NSManagedObject) throws {
        context.delete(object)
        try save()
    }
}
