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

class RecipeTableViewAdapter: NSObject, RecipeTableViewAdapterProtocol {

    // MARK: - Properties

    var tableView: UITableView?
    private lazy var dataSource = makeDataSource()

    init(tableView: UITableView?) {
        self.tableView = tableView
        super.init()

        configureTableView()
    }

    func configureTableView() {
        RecipeTableViewCell.register(to: tableView)
        tableView?.dataSource = dataSource
    }

    func makeDataSource() -> UITableViewDiffableDataSource<Section, RecipeUIModel> {
        return UITableViewDiffableDataSource(tableView: tableView!,
                                             cellProvider: {  tableView, indexPath, recipe in
                                                let cell: RecipeTableViewCell = tableView.dequeue(at: indexPath)
                                                cell.titleLabel.text = recipe.id.description
                                                return cell
            }
        )
    }

    func update(with recipes: [RecipeUIModel], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, RecipeUIModel>()
        snapshot.appendSections(Section.allCases)

        snapshot.appendItems(recipes, toSection: .recipe)

        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}

extension RecipeTableViewAdapter {
    enum Section: CaseIterable {
        case recipe
    }
}
