//
//  RecipeRemoteDataSourceTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import XCTest
import RxSwift
import RxTest
import Resolver
@testable import Recipe

class RecipeRemoteDataSourceTests: XCTestCase {

    var sut: RecipeRemoteDataSourceProtocol!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        Resolver.setUp()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        scheduler = nil
        disposeBag = nil
        sut = nil
    }

    func testGetAllRecipesNil() throws {
        // Given
        Resolver.test.register { RecipeRemoteServiceMockNil() as RecipeRemoteServiceProtocol }

        let observer = scheduler.createObserver([RecipeResponseModel]?.self)
        sut = RecipeRemoteDataSource()

        // When
        sut.getAllRecipes()
            .asObservable()
            .take(1)
            .subscribe(onNext: { result in
                observer.onNext(result)
                observer.onCompleted()
            }).disposed(by: disposeBag)
        scheduler.start()

        // Then
        XCTAssertEqual(observer.events, [
            .next(0, nil),
            .completed(0)
        ])
    }

    func testGetAllRecipesWithData() throws {
        // Given
        let observer = scheduler.createObserver([RecipeResponseModel]?.self)

        Resolver.test.register { RecipeRemoteServiceMockWithData() as RecipeRemoteServiceProtocol }

        sut = RecipeRemoteDataSource()

        // When
        sut.getAllRecipes()
            .asObservable()
            .subscribe(onNext: { result in
                observer.onNext(result)
                observer.onCompleted()
            }).disposed(by: disposeBag)

        scheduler.start()

        // Then
        let expectedResult = [RecipeResponseModel(id: Identifier<RecipeIdentifier>(id: 1),
                                                  title: "First",
                                                  coverImageURLString: "www.google.com")]
        XCTAssertEqual(observer.events,[
            .next(0, expectedResult),
            .completed(0)
        ])
    }
}
