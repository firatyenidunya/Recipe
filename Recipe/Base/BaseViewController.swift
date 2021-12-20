//
//  BaseViewController.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController: UIViewController, NavigatonBarConfigurable {

    // MARK: - IBOutlets

    @IBOutlet weak var navigationBar: UINavigationBar?

    // MARK: - Properties

    var disposeBag = DisposeBag()

    // MARK: - LifCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }

    // MARK: - NavigationBar Configuration

    override var title: String? {
        didSet {
            navigationBar?.topItem?.title = title
        }
    }

    // Below method gets call from NavigatonBarConfigurable
    @objc func navigationBarRightButtonOnClick() { }
}
