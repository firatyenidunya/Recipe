//
//  Endpoint.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

struct Endpoint {
    let path: String
    var queryItems: [String: String] = [:]
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "cookpad.github.io"
        components.path = path
        components.setQueryItems(with: queryItems)
        return components.url
    }
}
