//
//  BaseServiceTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import XCTest
import RxSwift
import RxTest
import Resolver
@testable import Recipe

class BaseServiceTests: XCTestCase {

    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    var sut: BaseServiceProtocol!
    var session: MockLoader!

    override func setUpWithError() throws {
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        session = MockLoader()
        sut = BaseService(urlSession: session)
    }

    override func tearDownWithError() throws {
        scheduler = nil
        disposeBag = nil
        sut = nil
        session = nil
    }

    func testSuccessfulResponse() {

        let data = try! JSONEncoder().encode("String")
        session.data = data

        let observer = scheduler.createObserver(String.self)

        getResult()
            .asObservable()
            .subscribe(onNext: { result in
                observer.onNext(result)
                observer.onCompleted()
            }).disposed(by: disposeBag)

        scheduler.start()

        XCTAssertEqual(observer.events, [
            .next(0, "String"),
            .completed(0)
        ])
    }

    func getResult() -> Single<String> {
        sut.request(with: RequestObject(path: "/path"), decoder: JSONDecoder())
    }
}
