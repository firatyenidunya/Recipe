//
//  ListStateTests.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import XCTest
@testable import Recipe

class ListStateTests: XCTestCase {

    func testToggleGrid() {
        var given = ListState.grid
        given.toggle()

        XCTAssertEqual(given, .list)
    }

    func testToggleList() {
        var given = ListState.list
        given.toggle()

        XCTAssertEqual(given, .grid)
    }
}
