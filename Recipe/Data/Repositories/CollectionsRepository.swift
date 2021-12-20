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

    @Autowired var collectionsRemoteDataSource: CollectionsRemoteDataSourceProtocol

    // MARK: - Methods

    func getAllCollections() -> Single<[CollectionsUIModel]> {
        return collectionsRemoteDataSource.getAllCollections()
    }
}
