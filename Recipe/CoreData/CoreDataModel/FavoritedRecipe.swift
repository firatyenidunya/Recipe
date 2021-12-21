//
//  Recipe.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import CoreData

class FavoritedRecipe: NSManagedObject {
    @NSManaged var id: NSNumber?
    @NSManaged var title: String?
    @NSManaged var coverImageURL: URL?
    @NSManaged var isFavorited: Bool
}
