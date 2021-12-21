//
//  CollectionsRepository.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import RxSwift

protocol CollectionsRepositoryProtocol {
    func getAllCollections() -> Single<[CollectionsUIModel]>
}

class CollectionsRepository: CollectionsRepositoryProtocol {

    // MARK: - Injected Properties

    @Autowired private var collectionsRemoteDataSource: CollectionsRemoteDataSourceProtocol

    // MARK: - Methods

    func getAllCollections() -> Single<[CollectionsUIModel]> {
        return collectionsRemoteDataSource.getAllCollections().map { responseModel -> [CollectionsUIModel] in
            CollectionsUIModel.convert(from: responseModel)
        }
    }
}
