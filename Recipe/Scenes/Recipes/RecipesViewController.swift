//
//  RecipesViewController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 19.12.2021.
//

import UIKit
import Combine

class RecipesViewController: BaseViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Injected Propeties

    @Autowired var viewModel: RecipesViewModelProtocol

    // MARK: - Properties

    var tableViewAdapter: RecipeTableViewAdapterProtocol?
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        configureNavigationBar()
        setupTableViewAdapter()
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateRecipeFavoriteStatus()
        Task {
            await viewModel.getAllRecipes()
        }
    }

    // MARK: - Methods

    func setupBindings() {
        viewModel
            .recipesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.tableViewAdapter?.update(with: value, animate: false)
            }.store(in: &cancellables)
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
