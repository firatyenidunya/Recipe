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
    var isFavorited: Bool = false
}

extension RecipeUIModel {
    static func convert(from response: [RecipeResponseModel]?) -> [Self] {
        guard let response = response else { return [] }

        var uiModel: [Self] = []

        response.forEach { (response) in
            guard let title = response.title,
                  let coverImageURL = URL(string: response.coverImageURLString ?? "") else {
                return
            }
            
            uiModel.append(RecipeUIModel(id: response.id,
                                         title: title,
                                         coverImageURL: coverImageURL))
        }

        return Array(uiModel.prefix(10))
    }
}
