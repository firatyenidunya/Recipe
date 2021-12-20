//
//  RecipeRepository.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxSwift

protocol RecipeRepositoryProtocol {
    func getAllRecipes() -> Single<[RecipeUIModel]>
}

class RecipeRepository: RecipeRepositoryProtocol {

    // MARK: - Injected Properties

    @LazyAutowired private var recieRemoteDataSource: RecipeRemoteDataSourceProtocol


    // MARK: - Methods

    func getAllRecipes() -> Single<[RecipeUIModel]> {
        recieRemoteDataSource.getAllRecipes()
    }

}
