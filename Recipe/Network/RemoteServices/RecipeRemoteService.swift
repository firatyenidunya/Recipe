//
//  RecipeRemoteService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

protocol RecipeRemoteServiceProtocol {
    func getAllRecipes() async throws -> [RecipeResponseModel]
}

class RecipeRemoteService: RecipeRemoteServiceProtocol, Requestable {
    typealias TargetEndpoint = RecipeEndpoint

    // MARK: - Methods

    func getAllRecipes() async throws -> [RecipeResponseModel] {
        try await request(with: RequestObject(path: build(targetEndpoint: .allRecipes)))
    }
}
