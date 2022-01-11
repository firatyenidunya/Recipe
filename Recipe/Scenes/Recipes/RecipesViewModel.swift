//
//  RecipesViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import Combine
import SwiftUI

protocol RecipesViewModelProtocol {
    var recipesPublisher: Published<[RecipeUIModel]>.Publisher { get }

    func getAllRecipes() async
    func addToFavorites(at index: Int)
    func updateRecipeFavoriteStatus()
}

class RecipesViewModel: BaseViewModel, RecipesViewModelProtocol {

    // MARK: - Injected Properties

    @Autowired private var recipeRepository: RecipeRepositoryProtocol

    // MARK: - Properties
    
    @Published var recipes: [RecipeUIModel] = []
    var recipesPublisher: Published<[RecipeUIModel]>.Publisher { $recipes }
    
    // MARK: - Methods

    func getAllRecipes() async {
        recipes = (try? await recipeRepository.getRecipes()) ?? []
    }
    
    func addToFavorites(at index: Int) {
        var recipes = self.recipes
        let selectedRecipe = recipes[index]

        if !selectedRecipe.isFavorited {
            recipeRepository.addRecipeToFavorites(with: selectedRecipe)
        } else {
            recipeRepository.removeRecipeFromFavorites(with: selectedRecipe)
        }

        recipes[index].isFavorited.toggle()
        self.recipes = recipes
    }

    func updateRecipeFavoriteStatus() {
        let ids = recipeRepository.getFavoritedRecipes().map { $0.id }
        var value = self.recipes

        value.indices.forEach { value[$0].isFavorited = ids.contains(value[$0].id) ? true : false}

        self.recipes = value
    }
}
