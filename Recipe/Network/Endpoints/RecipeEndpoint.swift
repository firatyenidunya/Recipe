//
//  RecipeEndpoint.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation

enum RecipeEndpoint: TargetEndpointProtocol {
    case allRecipes

    var base: String {
        return "/global-mobile-hiring/api"
    }

    var path: String {
        switch self {
            case .allRecipes:
                return base + "/recipes"
        }
    }
}
