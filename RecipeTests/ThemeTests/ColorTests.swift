//
//  ColorTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import XCTest
@testable import Recipe

class ColorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrimaryColorIsNotNil() {
        let primaryColor: UIColor = .primary
        XCTAssertNotEqual(primaryColor, .black)
    }

    func testSecondaryColorIsNotNil() {
        let secondaryColor: UIColor = .secondary
        XCTAssertNotEqual(secondaryColor, .black)
    }
}
