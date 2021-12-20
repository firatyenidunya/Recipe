//
//  CollectionsUICollectionViewAdapter.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import UIKit
import DisplaySwitcher

protocol CollectionsUICollectionViewAdapterProtocol {
    func reloadData(with dataSource: [CollectionsUIModel])
    func invertLayout()
}

class CollectionsUICollectionViewAdapter: NSObject, CollectionsUICollectionViewAdapterProtocol {

    // MARK: - Properties

    var collectionView: UICollectionView?
    var dataSource: [CollectionsUIModel]
    var defaultLayout: LayoutProtocol

    init(collectionView: UICollectionView?,
         dataSource: [CollectionsUIModel] = [],
         defaultLayout: LayoutProtocol = ListFlowLayout()) {
        self.collectionView = collectionView
        self.dataSource = dataSource
        self.defaultLayout = defaultLayout
        super.init()
        
        configureCollectionView()
        registerNibs()
    }

    func configureCollectionView() {
        collectionView?.collectionViewLayout = defaultLayout.layout
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }

    func registerNibs() {
        TitleAndImageCollectionViewCell.register(to: collectionView)
    }

    func reloadData(with dataSource: [CollectionsUIModel]) {
        self.dataSource = dataSource
        collectionView?.reloadData()
    }

    func invertLayout() {
        let transitionManager: TransitionManager
        let animationDuration = 0.3
        switch defaultLayout.layoutState {
        case .grid:
            defaultLayout = ListFlowLayout()
            transitionManager = TransitionManager(duration: animationDuration,
                                                  collectionView: collectionView!,
                                                  destinationLayout: defaultLayout.layout,
                                                  layoutState: .list)
        case .list:
            defaultLayout = GridFlowLayout()
            transitionManager = TransitionManager(duration: animationDuration,
                                                  collectionView: collectionView!,
                                                  destinationLayout: defaultLayout.layout,
                                                  layoutState: .grid)
        }
        transitionManager.startInteractiveTransition()
    }
}

extension CollectionsUICollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TitleAndImageCollectionViewCell = collectionView.dequeue(for: indexPath)
        let data = dataSource[indexPath.row]
        cell.configure(with: data.title, imageURL: data.coverImageURL)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                        newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        return customTransitionLayout
    }
}
