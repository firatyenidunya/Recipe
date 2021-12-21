//
//  RecipeUIModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

struct RecipeUIModel: Hashable {
    var id: Identifier<RecipeIdentifier>
    var title: String
    var coverImageURL: URL
    var isFavorited: Bool
}

extension RecipeUIModel {
    static func convert(from response: [RecipeResponseModel]?,
                        from localResponse: [FavoritedRecipe]) -> [Self] {
        guard let response = response else { return [] }

        var uiModel: [Self] = []

        let favoritedRecipeIds = localResponse.compactMap({ recipe -> Identifier<RecipeIdentifier> in
            return Identifier<RecipeIdentifier>(id: Int(truncating: recipe.id ?? -1))
        })

        for index in 0..<response.count {

            let response = response[index]

            guard let title = response.title,
                  let coverImageURL = URL(string: response.coverImageURLString ?? "") else {
                continue
            }

            let isFavorited = favoritedRecipeIds.contains(response.id)

            uiModel.append(RecipeUIModel(id: response.id,
                                         title: title,
                                         coverImageURL: coverImageURL,
                                         isFavorited: isFavorited))
        }

        return Array(uiModel.prefix(30))
    }

    static func convert(from localResponse: [FavoritedRecipe]) -> [Self] {
        var uiModel: [Self] = []

        localResponse.forEach { recipe in
            guard let id = recipe.id,
                  let title = recipe.title,
                  let coverImageURL = recipe.coverImageURL else {
                return
            }
            uiModel.append(RecipeUIModel(id: Identifier<RecipeIdentifier>(id: Int(truncating: id)),
                                         title: title,
                                         coverImageURL: coverImageURL,
                                         isFavorited: recipe.isFavorited))
        }
        return uiModel
    }
}
