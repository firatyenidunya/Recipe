//
//  MockLocalService.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import CoreData
@testable import Recipe

class MockLocalService: LocalService {
    override init() {
      super.init()

      let persistentStoreDescription = NSPersistentStoreDescription()
      persistentStoreDescription.type = NSInMemoryStoreType

      let container = NSPersistentContainer(
        name: LocalService.modelName,
        managedObjectModel: LocalService.model)
      container.persistentStoreDescriptions = [persistentStoreDescription]

      container.loadPersistentStores { _, error in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }

      persistentContainer = container
    }
}
