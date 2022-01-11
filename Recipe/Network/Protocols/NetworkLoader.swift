//
//  Loader.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

protocol NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}
