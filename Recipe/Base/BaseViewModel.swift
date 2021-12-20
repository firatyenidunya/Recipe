//
//  BaseViewModel.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import RxSwift

protocol BaseViewModelProtocol {
    var disposeBag: DisposeBag { get }
}

class BaseViewModel: BaseViewModelProtocol {
    var disposeBag = DisposeBag()
}
