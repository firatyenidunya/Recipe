//
//  CollectionsViewController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation
import UIKit
import Combine

class CollectionsViewController: BaseViewController {

    // MARK: - IBOutletss

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Injected Properties

    @Autowired var viewModel: CollectionsViewModelProtocol

    // MARK: - Properties

    var collectionViewAdapter: CollectionsUICollectionViewAdapterProtocol?
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        configureNavigationBar()
        setupCollectionViewAdapter()
        
        Task {
            await viewModel.getAllCollections()
        }
    }

    // MARK: - Bindings

    func setupBinding() {
        viewModel
            .collectionsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.collectionViewAdapter?.reloadData(with: value)
            }.store(in: &cancellables)
    }

    // MARK: - NavigationBar

    func configureNavigationBar() {
        title = "Collections"
        setRightBarButton(image: viewModel.listState.image)
    }

    override func navigationBarRightButtonOnClick() {
        super.navigationBarRightButtonOnClick()

        collectionViewAdapter?.invertLayout()
        viewModel.toggleListState()
        setRightBarButton(image: viewModel.listState.image)
    }

    // MARK: - CollectionView Adapter Configurations

    func setupCollectionViewAdapter() {
        collectionViewAdapter = CollectionsUICollectionViewAdapter(collectionView: collectionView)
    }
}
