//
//  RecipeRemoteDataSource.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

protocol RecipeRemoteDataSourceProtocol {
    func getAllRecipes() async throws -> [RecipeResponseModel]
}

class RecipeRemoteDataSource: RecipeRemoteDataSourceProtocol {

    // MARK: - Injected Properties

    @Autowired private var recipeRemoteService: RecipeRemoteServiceProtocol

    // MARK: - Methods

    func getAllRecipes() async throws -> [RecipeResponseModel] {
        try await recipeRemoteService.getAllRecipes()
    }
}
