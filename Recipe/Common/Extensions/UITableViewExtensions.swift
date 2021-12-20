//
//  UITableViewExtensions.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import UIKit

extension UITableView {

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
            else { fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self), at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
            else { fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }
}

extension UITableViewCell {
    static func register(to tableView: UITableView?) {
        let className = String(describing: Self.self)
        let nib = UINib(nibName: className, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: className)
    }
}

