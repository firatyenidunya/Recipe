//
//  CollectionsViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import Combine

protocol CollectionsViewModelProtocol {
    var listState: ListState { get set }
    var collectionsPublisher: Published<[CollectionsUIModel]>.Publisher { get }
    
    func getAllCollections() async
    func toggleListState()
}

class CollectionsViewModel: BaseViewModel, CollectionsViewModelProtocol {

    // MARK: - Injected Properties

    @Autowired private var collectionsRepository: CollectionsRepositoryProtocol

    // MARK: - Properties

    @Published var collections: [CollectionsUIModel] = []
    var collectionsPublisher: Published<[CollectionsUIModel]>.Publisher { $collections }

    var listState: ListState = .list

    // MARK: - Methods

    func getAllCollections() async {
        do {
            collections = try await collectionsRepository.getAllCollections()
        } catch {
            // missing error handling
        }
    }

    func toggleListState() {
        listState.toggle()
    }
}
