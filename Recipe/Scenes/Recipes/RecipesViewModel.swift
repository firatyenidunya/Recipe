//
//  RecipesViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol RecipesViewModelProtocol {
    var recipesSubject: BehaviorRelay<[RecipeUIModel]> { get }

    func getAllRecipes()
    func addToFavorites(at index: Int)
}

class RecipesViewModel: BaseViewModel, RecipesViewModelProtocol {

    // MARK: - Injected Properties

    @LazyAutowired var recipeRepository: RecipeRepositoryProtocol

    // MARK: - Properties
    
    var recipesSubject = BehaviorRelay<[RecipeUIModel]>(value: [])

    // MARK: - Methods

    func getAllRecipes() {
        recipeRepository
            .getRecipes()
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }
                self.recipesSubject.accept(result)
            }).disposed(by: disposeBag)
    }

    func addToFavorites(at index: Int) {
        var recipes = recipesSubject.value
        let selectedRecipe = recipes[index]

        if !selectedRecipe.isFavorited {
            recipeRepository.addRecipeToFavorites(with: selectedRecipe)
        } else {
            recipeRepository.removeRecipeFromFavorites(with: selectedRecipe)
        }

        recipes[index].isFavorited.toggle()
        recipesSubject.accept(recipes)
    }
}
