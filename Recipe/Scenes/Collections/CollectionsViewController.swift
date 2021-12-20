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
            .subscribe(onNext: { result in
                print(result)
            }).disposed(by: diposeBag)
    }

    // MARK: - NavigationBar

    func configureNavigationBar() {
        title = "Collections"
        setRightBarButton(image: .iconsList)
    }

    override func navigationBarRightButtonOnClick() {
        super.navigationBarRightButtonOnClick()
    }

    // MARK: - CollectionView Adapter Configurations

    func setupCollectionViewAdapter() {
        collectionViewAdapter = CollectionsUICollectionViewAdapter(collectionView: collectionView)
    }
}
