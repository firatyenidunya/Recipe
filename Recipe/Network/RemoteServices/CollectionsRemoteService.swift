//
//  CollectionsRemoteService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation

protocol CollectionsRemoteServiceProtocol {
    func getAllCollections() async throws -> [CollectionsResponseModel]
}

class CollectionsRemoteService: CollectionsRemoteServiceProtocol, Requestable {
    typealias TargetEndpoint = CollectionsEndpoint

    // MARK: - Methods
    
    func getAllCollections() async throws -> [CollectionsResponseModel] {
        try await request(with: RequestObject(path: build(targetEndpoint: .allCollections)))
    }
}
