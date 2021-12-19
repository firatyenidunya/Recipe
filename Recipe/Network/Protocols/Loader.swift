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
