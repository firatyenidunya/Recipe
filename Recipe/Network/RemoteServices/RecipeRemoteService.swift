//
//  RecipeRemoteService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import RxSwift

protocol RecipeRemoteServiceProtocol {
    func getAllRecipes() -> Single<[RecipeResponseModel]?>
}

class RecipeRemoteService: RecipeRemoteServiceProtocol, Requestable {
    typealias TargetEndpoint = RecipeEndpoint

    // MARK: - Methods

    func getAllRecipes() -> Single<[RecipeResponseModel]?> {
        request(with: RequestObject(path: build(targetEndpoint: .allRecipes)))
    }
}
