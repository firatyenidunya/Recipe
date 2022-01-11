//
//  URLSessionExtensions.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

extension URLSession: NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: request, completionHandler: completion).resume()
    }
    
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        try await self.data(for: request, delegate: delegate)
    }
}
