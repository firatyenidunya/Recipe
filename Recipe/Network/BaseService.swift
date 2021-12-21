//
//  BaseService.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation
import RxSwift

final class BaseService: BaseServiceProtocol {

    var urlSession: NetworkLoader

    init(urlSession: NetworkLoader = URLSession.shared) {
        self.urlSession = urlSession
    }

    @discardableResult
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) -> Single<T> {
        return Observable<T>.create { [self] observer in
            guard let urlRequest = requestObject.urlRequest else {
                observer.onError(RecipeError.invalidUrlRequest)
                return Disposables.create()
            }

            urlSession.load(using: urlRequest) { data, response, error in
                handle(response, with: decoder, with: data, to: observer)
            }

            return Disposables.create()
        }.share().asSingle()
    }

    private func handle<T: Decodable>(_ response: URLResponse?,
                                      with decoder: JSONDecoder,
                                      with data: Data?,
                                      to observer: AnyObserver<T>) {
        guard let httpData = data else {
            handle(response, with: data, to: observer)
            return
        }

        guard let result = try? decoder.decode(T.self, from: httpData) else {
            observer.onError(RecipeError.mappingFailed)
            return
        }

        observer.onNext(result)
        observer.onCompleted()
    }

    private func handle<T>(_ response: URLResponse?,
                           with data: Data?,
                           to observer: AnyObserver<T>) {
        if let response = response as? HTTPURLResponse, let httpStatus = response.httpStatus {
            observer.onError(RecipeError.httpError(status: httpStatus, data: data))
        } else {
            observer.onError(RecipeError.badResponse)
        }
    }
}
