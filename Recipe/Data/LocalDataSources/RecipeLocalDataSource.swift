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

    @Autowired private var recipeLocalService: RecipeLocalServiceProtocol

    func getFavoritedRecipes() -> [FavoritedRecipe] {
        return recipeLocalService.getFavoritedRecipes()
    }

    func addRecipeToFavorites(with recipe: RecipeUIModel) {
        var recipes = getFavoritedRecipes()
        let newRecipe = FavoritedRecipe(context: recipeLocalService.getContext())

        newRecipe.coverImageURL = recipe.coverImageURL
        newRecipe.id = NSNumber(value: recipe.id.id)
        newRecipe.title = recipe.title
        newRecipe.isFavorited = true

        recipes.append(newRecipe)
        recipeLocalService.save()
    }

    func removeRecipeFromFavorites(with recipe: RecipeUIModel) {
        let recipes = getFavoritedRecipes()
        guard let selectedRecipe = recipes.filter({ $0.id == NSNumber(value: recipe.id.id) }).first else {
            return
        }
        recipeLocalService.deleteRecipe(with: selectedRecipe)
    }
}
