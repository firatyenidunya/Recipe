//
//  RequestObject.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

struct RequestObject {
    var path: String
    var httpMethod: HTTPMethod = .get
    var parameters: [String: String] = [:]
    var headers: [String: String] = [:]

    private var endpoint: EndpointComponent {
        return EndpointComponent(path: path, queryItems: parameters)
    }
    
    func getUrlRequest() throws -> URLRequest {
        guard let url = endpoint.url else {
            throw RecipeError.invalidUrlRequest
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.description
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}
