//
//  Loader.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

protocol Loader {
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    func load(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Loader {
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: request, completionHandler: completion).resume()
    }

    func load(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url, completionHandler: completionHandler).resume()
    }
}
