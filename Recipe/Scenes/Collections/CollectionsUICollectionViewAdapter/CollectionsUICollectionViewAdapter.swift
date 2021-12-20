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

    init(collectionView: UICollectionView?) {
        self.collectionView = collectionView
    }
}
