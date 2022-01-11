//
//  CollectionsUIModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import UIKit

struct CollectionsUIModel: Equatable {
    var id: Identifier<CollectionIdentifier>
    var title: String
    var coverImageURL: URL
}

extension CollectionsUIModel {
    static func convert(from responseModel: [CollectionsResponseModel]) -> [Self] {
        var uiModel: [CollectionsUIModel] = []

        responseModel.forEach { (response) in
            guard var title = response.title,
                  let coverImageURL = URL(string: response.imageUrls?.randomElement() ?? "")else {
                return
            }

            title += " - " + String(response.recipeCount ?? 0) + " Recipes"

            uiModel.append(CollectionsUIModel(id: response.id,
                                              title: title,
                                              coverImageURL: coverImageURL))
        }

        return uiModel
    }
}
