//
//  CollectionsRemoteDataSource.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import RxSwift

protocol CollectionsRemoteDataSourceProtocol {
    func getAllCollections() -> Single<[CollectionsResponseModel]?>
}

class CollectionsRemoteDataSource: CollectionsRemoteDataSourceProtocol {

    // MARK: - Injected Properties

    @Autowired private var collectionsRemoteService: CollectionsRemoteServiceProtocol

    // MARK: - Methods

    func getAllCollections() -> Single<[CollectionsResponseModel]?> {
        collectionsRemoteService.getAllCollections()
    }
}
