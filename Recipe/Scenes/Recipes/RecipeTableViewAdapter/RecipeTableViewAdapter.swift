//
//  RecipeTableViewAdapter.swift
//  Recipe
//
//  Created by Firat Yenidunya on 21.12.2021.
//

import Foundation
import UIKit

protocol RecipeTableViewAdapterProtocol {
    func update(with recipes: [RecipeUIModel], animate: Bool)
}

protocol RecipeTableViewAdapterDelegate: AnyObject {
    func didAddFavorites(at index: Int)
}

class RecipeTableViewAdapter: NSObject, RecipeTableViewAdapterProtocol {

    // MARK: - Properties

    weak var delegate: RecipeTableViewAdapterDelegate?
    var tableView: UITableView?
    private lazy var dataSource = makeDataSource()

    init(tableView: UITableView?,
         delegate: RecipeTableViewAdapterDelegate?) {
        self.tableView = tableView
        self.delegate = delegate
        super.init()

        configureTableView()
    }

    func configureTableView() {
        RecipeTableViewCell.register(to: tableView)
        tableView?.dataSource = dataSource
        tableView?.rowHeight = UITableView.automaticDimension
    }

    func makeDataSource() -> UITableViewDiffableDataSource<Section, RecipeUIModel> {
        return UITableViewDiffableDataSource(tableView: tableView!,
                                             cellProvider: {  tableView, indexPath, recipe in
                                                let cell: RecipeTableViewCell = tableView.dequeue(at: indexPath)
                                                let cellUIModel = RecipeTableViewCellUIModel(title: recipe.title,
                                                                                             coverImageURL: recipe.coverImageURL,
                                                                                             isFavorited: recipe.isFavorited,
                                                                                             indexPath: indexPath)
                                                cell.configure(with: cellUIModel)
                                                cell.delegate = self
                                                return cell
            }
        )
    }

    func update(with recipes: [RecipeUIModel], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, RecipeUIModel>()
        snapshot.appendSections(Section.allCases)

        snapshot.appendItems(recipes, toSection: .recipe)
        dataSource.applySnapshotUsingReloadData(snapshot, completion: nil)
    }
}

extension RecipeTableViewAdapter: RecipeTableViewCellDelegate {
    func didAddFavorites(at indexPath: IndexPath) {
        delegate?.didAddFavorites(at: indexPath.row)
    }
}

extension RecipeTableViewAdapter {
    enum Section: CaseIterable {
        case recipe
    }
}
