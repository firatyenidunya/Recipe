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

struct RecipeResponseModel: Decodable, Equatable {
    let id: Identifier<RecipeIdentifier>
    let title: String?
    let coverImageURLString: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case coverImageURLString  = "image_url"
    }
}
