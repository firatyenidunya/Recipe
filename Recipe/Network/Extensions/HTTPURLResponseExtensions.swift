//
//  HTTPURLResponseExtensions.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

extension HTTPURLResponse {
    var httpStatus: HTTPStatus? {
        HTTPStatus(rawValue: statusCode)
    }
}
