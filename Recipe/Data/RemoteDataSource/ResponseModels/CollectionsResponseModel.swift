//
//  CollectionsResponseModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation

struct CollectionIdentifier: IdentifierType {
    typealias KeyType = Int
}

struct CollectionsResponseModel: Decodable, Equatable {
    let id: Identifier<CollectionIdentifier>
    let title: String?
    let recipeCount: Int?
    let imageUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case id, title
        case recipeCount = "recipe_count"
        case imageUrls  = "preview_image_urls"
    }
}
