//
//  FavoritesViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol FavoritesViewModelProtocol {
    var recipesSubject: BehaviorRelay<[RecipeUIModel]> { get }

    func getFavoritedRecipes()
    func removeFromFavorites(at index: Int)
}

class FavoritesViewModel: BaseViewModel,FavoritesViewModelProtocol {

    // MARK: - Injected Properties

    @LazyAutowired var recipeRepository: RecipeRepositoryProtocol

    // MARK: - Properties

    var recipesSubject = BehaviorRelay<[RecipeUIModel]>(value: [])

    // MARK: - Methods

    func getFavoritedRecipes() {
        recipeRepository
            .getFavoritedRecipes()
            .subscribe(onSuccess: { [weak self] recipes in
                guard let self = self else { return }
                self.recipesSubject.accept(recipes)
            }).disposed(by: disposeBag)
    }

    func removeFromFavorites(at index: Int) {
        var value = recipesSubject.value
        value[index].isFavorited.toggle()
        recipesSubject.accept(value)

        recipeRepository.removeRecipeFromFavorites(with: value[index])
    }
}
