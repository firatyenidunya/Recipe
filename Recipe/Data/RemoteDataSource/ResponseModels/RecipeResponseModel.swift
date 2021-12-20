//
//  RecipeResponseModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

struct RecipeIdentifier: IdentifierType {
    typealias KeyType = Int
}

struct RecipeResponseModel: Decodable {
    let id: Identifier<RecipeIdentifier>
}
