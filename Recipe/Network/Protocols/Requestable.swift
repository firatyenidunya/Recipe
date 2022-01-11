//
//  Requestable.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import Resolver

protocol Requestable {
    associatedtype TargetEndpoint: TargetEndpointProtocol

    func request<T: Decodable>(baseService: BaseServiceProtocol,
                                with object: RequestObject) async throws -> T
}

extension Requestable {

    /// Builds a path from givien TargetEndpoint type
    func build(targetEndpoint: TargetEndpoint) -> String {
        targetEndpoint.path
    }

    /// Sends requst to remote with given RequestObject
    func request<T: Decodable>(baseService: BaseServiceProtocol = Resolver.resolve(),
                                with object: RequestObject) async throws -> T {
        return try await baseService.request(with: object)
    }
}
