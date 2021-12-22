//
//  RecipeLocalService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 22.12.2021.
//

import Foundation
import CoreData

protocol RecipeLocalServiceProtocol {
    func getContext() -> NSManagedObjectContext
    func getFavoritedRecipes() -> [FavoritedRecipe]
    func deleteRecipe(with recipe: FavoritedRecipe)
    func save()
}

class RecipeLocalService: RecipeLocalServiceProtocol {
    @Autowired private var localService: LocalServiceProtocol

    func getContext() -> NSManagedObjectContext {
        return localService.context
    }

    func getFavoritedRecipes() -> [FavoritedRecipe] {
        return localService.fetch(FavoritedRecipe.self)
    }

    func save() {
        try? localService.save()
    }

    func deleteRecipe(with recipe: FavoritedRecipe) {
        try? localService.delete(recipe)
    }
}
