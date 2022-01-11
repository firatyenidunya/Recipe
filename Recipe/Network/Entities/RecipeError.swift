//
//  RecipeError.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

enum RecipeError: Error {
    case invalidUrlRequest
    case httpError(status: HTTPStatus)
    case unknown(error: NSError)
    case customError(_ code: Int, _ message: String, _ data: Data? = nil)
    case mappingFailed
    case badResponse

    var errorCode: Int {
        switch self {
            case .httpError(let error):
                return error.rawValue
            case .unknown(let error):
                return error.code
            case .customError(let code, _, _):
                return code
            case .mappingFailed, .badResponse, .invalidUrlRequest:
                return 0
        }
    }
}
