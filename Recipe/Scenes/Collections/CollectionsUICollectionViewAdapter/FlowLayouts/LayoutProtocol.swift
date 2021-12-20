//
//  LayoutProtocol.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import DisplaySwitcher

protocol LayoutProtocol {
    var layout: DisplaySwitchLayout { get }
    var layoutState: LayoutState { get }
}
