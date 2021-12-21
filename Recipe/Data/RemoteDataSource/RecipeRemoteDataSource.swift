//
//  RecipeRemoteDataSource.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxSwift

protocol RecipeRemoteDataSourceProtocol {
    func getAllRecipes() -> Single<[RecipeResponseModel]?>
}

class RecipeRemoteDataSource: RecipeRemoteDataSourceProtocol {

    // MARK: - Injected Properties

    @LazyAutowired private var recipeRemoteService: RecipeRemoteServiceProtocol

    // MARK: - Methods

    func getAllRecipes() -> Single<[RecipeResponseModel]?> {
        recipeRemoteService.getAllRecipes()
    }
}
