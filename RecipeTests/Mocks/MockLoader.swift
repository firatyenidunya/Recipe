//
//  MockLoader.swift
//  RecipeTests
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
@testable import Recipe

class MockLoader: NetworkLoader {
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?

    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, urlResponse, error)
    }
}
