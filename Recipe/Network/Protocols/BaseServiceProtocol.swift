//
//  BaseServiceProtocol.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                                decoder: JSONDecoder) async throws -> T
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        try await request(with: requestObject, decoder: decoder)
    }
}
