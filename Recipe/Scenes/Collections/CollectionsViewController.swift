//
//  CollectionsViewController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import Foundation
import UIKit

class CollectionsViewController: BaseViewController {

    // MARK: - IBOutletss

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Injected Properties

    @Autowired var viewModel: CollectionsViewModelProtocol

    // MARK: - Properties

    var collectionViewAdapter: CollectionsUICollectionViewAdapterProtocol?

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        configureNavigationBar()
        setupCollectionViewAdapter()
        viewModel.getAllCollections()
    }

    // MARK: - Bindings

    func setupBinding() {
        viewModel
            .collectionsSubject
            .observe(on: Schedulers.main)
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }
                self.collectionViewAdapter?.reloadData(with: result)
            }).disposed(by: disposeBag)
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
