//
//  RecipesViewController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import UIKit

class RecipesViewController: BaseViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Injected Propeties

    @Autowired var viewModel: RecipesViewModelProtocol

    // MARK: - Properties

    var tableViewAdapter: RecipeTableViewAdapterProtocol?

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        configureNavigationBar()
        setupTableViewAdapter()
        viewModel.getAllRecipes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateRecipeFavoriteStatus()
    }

    // MARK: - Methods

    func setupBindings() {
        viewModel
            .recipesSubject
            .observe(on: Schedulers.main)
            .skip(1)
            .subscribe(onNext: { [weak self] recipes in
                guard let self = self else { return }
                self.tableViewAdapter?.update(with: recipes, animate: false)
            }).disposed(by: disposeBag)
    }

    // MARK: - NavigationBar

    func configureNavigationBar() {
        title = "Recipes"
    }

    func setupTableViewAdapter() {
        tableViewAdapter = RecipeTableViewAdapter(tableView: tableView, delegate: self)
    }
}

extension RecipesViewController: RecipeTableViewAdapterDelegate {
    func didAddFavorites(at index: Int) {
        viewModel.addToFavorites(at: index)
    }
}
