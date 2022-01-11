//
//  CollectionsRemoteDataSource.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation

protocol CollectionsRemoteDataSourceProtocol {
    func getAllCollections() async throws -> [CollectionsResponseModel]
}

class CollectionsRemoteDataSource: CollectionsRemoteDataSourceProtocol {

    // MARK: - Injected Properties

    @Autowired private var collectionsRemoteService: CollectionsRemoteServiceProtocol

    // MARK: - Methods

    func getAllCollections() async throws -> [CollectionsResponseModel] {
        try await collectionsRemoteService.getAllCollections()
    }
}
