//
//  BaseService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation

final class BaseService: BaseServiceProtocol {

    var urlSession: NetworkLoader

    init(urlSession: NetworkLoader = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        do {
            let urlRequest = try requestObject.getUrlRequest()
            let (data, response) = try await urlSession.load(for: urlRequest, delegate: nil)
            return try handle(response, with: decoder, with: data)
        } catch {
            return try handle(nil, data: nil, error: error)
        }
    }
    
    private func handle<T: Decodable>(_ response: URLResponse?,
                                      with decoder: JSONDecoder,
                                      with data: Data?) throws -> T {
        guard let httpData = data else {
            return try handle(response, data: data, error: nil)
        }
        
        do {
            return try decoder.decode(T.self, from: httpData)
        } catch {
            return try handle(response, data: data, error: error)
        }
    }

    private func handle<T: Decodable>(_ response: URLResponse?,
                                      data: Data?,
                                      error: Error?) throws -> T {
        if let response = response as? HTTPURLResponse,
           let httpStatus = response.httpStatus, httpStatus.httpStatusType != .success {
            throw RecipeError.httpError(status: httpStatus)
        }
        
        if let err = error {
            throw RecipeError.unknown(error: err as NSError)
        }
        
        throw RecipeError.badResponse
    }
}
