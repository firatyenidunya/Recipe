//
//  FavoritesViewController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import UIKit

class FavoritesViewController: BaseViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Injected Properties

    @LazyAutowired var viewModel: FavoritesViewModelProtocol

    // MARK: - Properties

    var tableViewAdapter: RecipeTableViewAdapterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupTableViewAdapter()
        configureNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getFavoritedRecipes()
    }

    // MARK: - Methods

    func setupBindings() {
        viewModel
            .recipesSubject
            .observe(on: Schedulers.main)
            .subscribe(onNext: { [weak self] recipes in
                guard let self = self else { return }
                self.tableViewAdapter?.update(with: recipes, animate: false)
            }).disposed(by: disposeBag)
    }

    // MARK: - NavigationBar

    func configureNavigationBar() {
        title = "Favorites"
    }

    func setupTableViewAdapter() {
        tableViewAdapter = RecipeTableViewAdapter(tableView: tableView, delegate: self)
    }
}

extension FavoritesViewController: RecipeTableViewAdapterDelegate {
    func didAddFavorites(at index: Int) {
        viewModel.removeFromFavorites(at: index)
    }
}
