//
//  FavoritesViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import Combine

protocol FavoritesViewModelProtocol {
    var recipesPublisher: Published<[RecipeUIModel]>.Publisher { get }

    func getFavoritedRecipes()
    func removeFromFavorites(at index: Int)
}

class FavoritesViewModel: BaseViewModel,FavoritesViewModelProtocol {

    // MARK: - Injected Properties

    @LazyAutowired var recipeRepository: RecipeRepositoryProtocol

    // MARK: - Properties

    var recipesPublisher: Published<[RecipeUIModel]>.Publisher { $recipes }
    @Published var recipes: [RecipeUIModel] = []

    // MARK: - Methods

    func getFavoritedRecipes() {
        recipes = recipeRepository.getFavoritedRecipes()
    }

    func removeFromFavorites(at index: Int) {
        var value = self.recipes
        recipeRepository.removeRecipeFromFavorites(with: value[index])
        value.remove(at: index)
        self.recipes = value
    }
}
