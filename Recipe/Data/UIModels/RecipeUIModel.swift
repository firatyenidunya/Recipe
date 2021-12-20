//
//  RecipeUIModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

struct RecipeUIModel: Hashable {
    var id: Identifier<RecipeIdentifier>
}

extension RecipeUIModel {
    static func convert(from response: [RecipeResponseModel]?) -> [Self] {
        guard let response = response else { return [] }

        var uiModel: [Self] = []

        response.forEach { (response) in
            uiModel.append(RecipeUIModel(id: response.id))
        }

        return uiModel
    }
}
