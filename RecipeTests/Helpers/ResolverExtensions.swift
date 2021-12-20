//
//  ResolverExtensions.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import XCTest
import Resolver

@testable import Recipe

extension Resolver {

    static var test: Resolver!

    static func setUp() {
        Resolver.test = Resolver(child: .main)
        Resolver.root = .test
    }

    static func tearDown() {
        Resolver.root = .main
    }
}
