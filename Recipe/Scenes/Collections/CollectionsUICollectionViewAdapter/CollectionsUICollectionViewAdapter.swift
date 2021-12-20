//
//  CollectionsUICollectionViewAdapter.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import UIKit

protocol CollectionsUICollectionViewAdapterProtocol {

}

class CollectionsUICollectionViewAdapter: NSObject, CollectionsUICollectionViewAdapterProtocol {
    var collectionView: UICollectionView?
    var dataSource: [CollectionsUIModel]

    init(collectionView: UICollectionView?,
         dataSource: [CollectionsUIModel] = []) {
        self.collectionView = collectionView
        self.dataSource = dataSource
    }

    func configureCollectionView() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
}

extension CollectionsUICollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    }
}
