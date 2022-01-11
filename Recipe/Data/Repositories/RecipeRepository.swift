//
//  RecipeRepository.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

protocol RecipeRepositoryProtocol {
    func getRecipes() async throws -> [RecipeUIModel]
    func getFavoritedRecipes() -> [RecipeUIModel]
    
    func addRecipeToFavorites(with recipe: RecipeUIModel)
    func removeRecipeFromFavorites(with recipe: RecipeUIModel)
}

class RecipeRepository: RecipeRepositoryProtocol {

    // MARK: - Injected Properties

    @Autowired private var recipeRemoteDataSource: RecipeRemoteDataSourceProtocol
    @Autowired private var recipeLocalDataSource: RecipeLocalDataSourceProtocol

    // MARK: - Methods

    func getRecipes() async throws -> [RecipeUIModel] {
        let favoritedRecipes = recipeLocalDataSource.getFavoritedRecipes()
        let allRecipes = try await recipeRemoteDataSource.getAllRecipes()
        return RecipeUIModel.convert(from: allRecipes, from: favoritedRecipes)
    }

    func getFavoritedRecipes() -> [RecipeUIModel] {
        let localResponse = recipeLocalDataSource.getFavoritedRecipes()
        return RecipeUIModel.convert(from: localResponse)
    }

    func addRecipeToFavorites(with recipe: RecipeUIModel) {
        recipeLocalDataSource.addRecipeToFavorites(with: recipe)
    }

    func removeRecipeFromFavorites(with recipe: RecipeUIModel) {
        recipeLocalDataSource.removeRecipeFromFavorites(with: recipe)
    }
}
