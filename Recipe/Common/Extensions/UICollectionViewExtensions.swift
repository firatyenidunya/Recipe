//
//  UICollectionViewExtensions.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(withIdentifier identifier: String = String(describing: T.self),
                                          for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from collectionView \(self)")
        }
        return cell
    }
}

extension UICollectionViewCell {
    static func register(to collectionView: UICollectionView?) {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
    }
}
