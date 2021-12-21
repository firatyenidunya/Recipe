//
//  RecipesViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxSwift

protocol RecipesViewModelProtocol {
    var recipesSubject: PublishSubject<[RecipeUIModel]> { get }

    func getAllRecipes()
    func addToFavorites(at index: Int)
}

class RecipesViewModel: BaseViewModel, RecipesViewModelProtocol {

    // MARK: - Injected Properties

    @LazyAutowired var recipeRepository: RecipeRepositoryProtocol

    // MARK: - Properties
    
    var recipesSubject = PublishSubject<[RecipeUIModel]>()

    // MARK: - Methods

    func getAllRecipes() {
        recipeRepository
            .getRecipes()
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }
                self.recipesSubject.onNext(result)
            }).disposed(by: disposeBag)
    }

    func addToFavorites(at index: Int) {
    }
}
