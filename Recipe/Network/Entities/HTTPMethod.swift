//
//  HTTPMethod.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible {
    case get
    case post
    case put
    case delete

    var description: String {
        rawValue.uppercased()
    }
}
