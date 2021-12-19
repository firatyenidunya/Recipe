//
//  ColorTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 18.12.2021.
//

import XCTest
@testable import Recipe

class ColorTests: XCTestCase {

    func testPrimaryColorIsNotNil() {
        let primaryColor: UIColor = .primary
        XCTAssertNotEqual(primaryColor, .black)
    }

    func testSecondaryColorIsNotNil() {
        let secondaryColor: UIColor = .secondary
        XCTAssertNotEqual(secondaryColor, .black)
    }
}
