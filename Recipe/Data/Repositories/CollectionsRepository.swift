//
//  CollectionsRepository.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation

protocol CollectionsRepositoryProtocol {
    func getAllCollections() async throws -> [CollectionsUIModel]
}

class CollectionsRepository: CollectionsRepositoryProtocol {

    // MARK: - Injected Properties

    @Autowired private var collectionsRemoteDataSource: CollectionsRemoteDataSourceProtocol

    // MARK: - Methods

    func getAllCollections() async throws -> [CollectionsUIModel] {
        let collections = try await collectionsRemoteDataSource.getAllCollections()
        return CollectionsUIModel.convert(from: collections)
    }
}
