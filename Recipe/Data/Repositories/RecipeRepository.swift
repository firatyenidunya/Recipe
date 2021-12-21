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
}

class RecipeRepository: RecipeRepositoryProtocol {

    // MARK: - Injected Properties

    @LazyAutowired private var recipeRemoteDataSource: RecipeRemoteDataSourceProtocol

    // MARK: - Methods

    func getRecipes() -> Single<[RecipeUIModel]> {
        recipeRemoteDataSource.getAllRecipes().map { responseModel -> [RecipeUIModel] in
            return RecipeUIModel.convert(from: responseModel)
        }
    }
}
