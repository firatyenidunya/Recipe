//
//  RecipesRemoteServiceMock.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import RxSwift
@testable import Recipe

class RecipeRemoteServiceMockNil: RecipeRemoteServiceProtocol {
    func getAllRecipes() -> Single<[RecipeResponseModel]?> {
        return Observable<[RecipeResponseModel]?>.create { observer in
            observer.onNext(nil)
            observer.onCompleted()
            return Disposables.create()
        }.asSingle()
    }
}

class RecipeRemoteServiceMockWithData: RecipeRemoteServiceProtocol {
    func getAllRecipes() -> Single<[RecipeResponseModel]?> {
        return Observable<[RecipeResponseModel]?>.create { observer in
            observer.onNext(RecipeResponseModel.mock())
            observer.onCompleted()
            return Disposables.create()
        }.asSingle()
    }
}

fileprivate extension RecipeResponseModel {
    static func mock() -> [Self] {
        return [Self(id: Identifier<RecipeIdentifier>(id: 1),
                     title: "First",
                     coverImageURLString: "www.google.com")]
    }
}
