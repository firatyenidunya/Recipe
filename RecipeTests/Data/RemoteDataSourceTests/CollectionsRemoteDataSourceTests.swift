//
//  CollectionsRemoteDataSourceTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import XCTest
import RxSwift
import RxTest
import Resolver
@testable import Recipe

class CollectionsRemoteDataSourceTests: XCTestCase {

    var sut: CollectionsRemoteDataSourceProtocol!
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

    func testGetAllCollectionsNil() throws {
        Resolver.test.register { CollectionsRemoteServiceMockNil() as CollectionsRemoteServiceProtocol }

        let observer = scheduler.createObserver([CollectionsUIModel].self)
        sut = CollectionsRemoteDataSource()
        sut.getAllCollections()
            .asObservable()
            .take(1)
            .subscribe(onNext: { result in
                observer.onNext(result)
                observer.onCompleted()
        }).disposed(by: disposeBag)
        scheduler.start()

        XCTAssertEqual(observer.events, [
                        .next(0, []),
                        .completed(0)
        ])
    }

    func testGetAllCollectionsWithData() throws {
        let observer = scheduler.createObserver([CollectionsUIModel].self)

        Resolver.test.register { CollectionsRemoteServiceMockWithData() as CollectionsRemoteServiceProtocol }

        sut = CollectionsRemoteDataSource()

        sut.getAllCollections()
            .asObservable()
            .subscribe(onNext: { result in
                observer.onNext(result)
                observer.onCompleted()
            }).disposed(by: disposeBag)

        scheduler.start()

        let expectedResult = [CollectionsUIModel(id: Identifier<CollectionIdentifier>(id: 1),
                                                 title: "First - 1 Recipes",
                                                 coverImageURL: URL(string: "cookpad.github.io")!)]
        XCTAssertEqual(observer.events,[
            .next(0, expectedResult),
            .completed(0)
        ])
    }
}
