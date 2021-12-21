//
//  RecipeRepository.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxSwift

protocol RecipeRepositoryProtocol {
    func getRecipes() -> Single<[RecipeUIModel]>
    func getFavoritedRecipes() -> [RecipeUIModel]
    func getFavoritedRecipes() -> Single<[RecipeUIModel]>
    
    func addRecipeToFavorites(with recipe: RecipeUIModel)
    func removeRecipeFromFavorites(with recipe: RecipeUIModel)
}

class RecipeRepository: RecipeRepositoryProtocol {

    // MARK: - Injected Properties

    @Autowired private var recipeRemoteDataSource: RecipeRemoteDataSourceProtocol
    @Autowired private var recipeLocalDataSource: RecipeLocalDataSourceProtocol

    // MARK: - Methods

    func getRecipes() -> Single<[RecipeUIModel]> {
        let favoritedRecipes = recipeLocalDataSource.getFavoritedRecipes()
        
        return recipeRemoteDataSource.getAllRecipes().map { responseModel -> [RecipeUIModel] in
            return RecipeUIModel.convert(from: responseModel, from: favoritedRecipes)
        }
    }

    func getFavoritedRecipes() -> Single<[RecipeUIModel]> {

        let favoritedRecipes = recipeLocalDataSource.getFavoritedRecipes()

        return Observable<[RecipeUIModel]>.create { observer in
            observer.onNext(RecipeUIModel.convert(from: favoritedRecipes))
            observer.onCompleted()
            return Disposables.create()
        }.asSingle()
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
