//
//  CollectionsRemoteServiceMock.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

@testable import Recipe
import RxSwift

class CollectionsRemoteServiceMockNil: CollectionsRemoteServiceProtocol {
    func getAllCollections() -> Single<[CollectionsResponseModel]?> {
        return Observable<[CollectionsResponseModel]?>.create { observer in
            observer.onNext(nil)
            observer.onCompleted()
            return Disposables.create()
        }.asSingle()
    }
}

class CollectionsRemoteServiceMockWithData: CollectionsRemoteServiceProtocol {
    func getAllCollections() -> Single<[CollectionsResponseModel]?> {
        return Observable<[CollectionsResponseModel]?>.create { observer in
            observer.onNext(CollectionsResponseModel.mock())
            observer.onCompleted()
            return Disposables.create()
        }.asSingle()
    }
}


fileprivate extension CollectionsResponseModel {
    static func mock() -> [Self] {
        return [CollectionsResponseModel(id: Identifier<CollectionIdentifier>(id: 1),
                                         title: "First",
                                         recipeCount: 1,
                                         imageUrls: ["cookpad.github.io"])]
    }
}
