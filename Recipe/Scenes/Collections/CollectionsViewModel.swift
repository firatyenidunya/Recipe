//
//  CollectionsViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import RxSwift

protocol CollectionsViewModelProtocol {
    func getAllCollections()

    var collectionsSubject: PublishSubject<[CollectionsUIModel]> { get }
}

class CollectionsViewModel: BaseViewModel, CollectionsViewModelProtocol {

    // MARK: - Injected Properties

    @Autowired var collectionsRepository: CollectionsRepositoryProtocol

    // MARK: - Properties

    var collectionsSubject = PublishSubject<[CollectionsUIModel]>()

    // MARK: - Methods

    func getAllCollections() {
        collectionsRepository
            .getAllCollections()
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }
                self.collectionsSubject.onNext(result)
            }).disposed(by: disposeBag)
    }
}
