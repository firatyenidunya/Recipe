//
//  RecipeLocalDataSource.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

protocol RecipeLocalDataSourceProtocol {
    func getFavoritedRecipes() -> [FavoritedRecipe]
    func addRecipeToFavorites(with recipe: RecipeUIModel)
    func removeRecipeFromFavorites(with recipe: RecipeUIModel)
}

class RecipeLocalDataSource: RecipeLocalDataSourceProtocol {

    @LazyAutowired var localService: LocalServiceProtocol

    func getFavoritedRecipes() -> [FavoritedRecipe] {
        return localService.fetch(FavoritedRecipe.self)
    }

    func addRecipeToFavorites(with recipe: RecipeUIModel) {
        var recipes = getFavoritedRecipes()
        let newRecipe = FavoritedRecipe(context: localService.context)

        newRecipe.coverImageURL = recipe.coverImageURL
        newRecipe.id = NSNumber(value: recipe.id.id)
        newRecipe.title = recipe.title
        newRecipe.isFavorited = true

        recipes.append(newRecipe)
        try? localService.save()
    }

    func removeRecipeFromFavorites(with recipe: RecipeUIModel) {
        let recipes = getFavoritedRecipes()
        guard let selectedRecipe = recipes.filter({ $0.id == NSNumber(value: recipe.id.id) }).first else {
            return
        }
        try? localService.delete(selectedRecipe)
    }
}
