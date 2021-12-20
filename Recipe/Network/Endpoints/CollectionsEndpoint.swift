//
//  CollectionsEndpoint.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation

enum CollectionsEndpoint: TargetEndpointProtocol {
    case allCollections

    var base: String {
        return "/global-mobile-hiring/api"
    }

    var path: String {
        switch self {
            case .allCollections:
                return base + "/collections"
        }
    }
}
