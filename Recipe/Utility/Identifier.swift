//
//  Identifier.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation

// Type-safe identifier
struct Identifier<T: IdentifierType> {
    let id: T.KeyType
}

protocol IdentifierType {
    associatedtype KeyType: Codable & Hashable
}


extension Identifier: Hashable, Codable, CustomStringConvertible {
    var description: String {
        return ("\(id)")
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        id = try container.decode(T.KeyType.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(id)
    }
}
