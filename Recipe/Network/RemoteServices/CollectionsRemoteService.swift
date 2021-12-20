//
//  CollectionsRemoteService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import RxSwift

protocol CollectionsRemoteServiceProtocol {
    func getAllCollections() -> Single<[CollectionsResponseModel]>
}

class CollectionsRemoteService: CollectionsRemoteServiceProtocol, Requestable {
    typealias TargetEndpoint = CollectionsEndpoint

    // MARK: - Methods

    func getAllCollections() -> Single<[CollectionsResponseModel]> {
        request(with: RequestObject(path: build(targetEndpoint: .allCollections)))
    }
}
