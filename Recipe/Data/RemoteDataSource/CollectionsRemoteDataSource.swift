//
//  CollectionsRemoteDataSource.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import RxSwift

protocol CollectionsRemoteDataSourceProtocol {
    func getAllCollections() -> Single<[CollectionsUIModel]>
}

class CollectionsRemoteDataSource: CollectionsRemoteDataSourceProtocol {

    // MARK: - Injected Properties

    @Autowired private var collectionsRemoteService: CollectionsRemoteServiceProtocol

    // MARK: - Methods

    func getAllCollections() -> Single<[CollectionsUIModel]> {
        collectionsRemoteService.getAllCollections().map { responseModel -> [CollectionsUIModel] in
            CollectionsUIModel.convert(from: responseModel)
        }
    }
}
