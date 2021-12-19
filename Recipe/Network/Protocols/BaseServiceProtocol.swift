//
//  BaseServiceProtocol.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation
import RxSwift

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder) -> Single<T>
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) -> Single<T> {
        request(with: requestObject, decoder: decoder)
    }
}
