//
//  GridFlowLayout.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import Foundation
import DisplaySwitcher

struct GridFlowLayout: LayoutProtocol {
    let layout: DisplaySwitchLayout
    let layoutState: LayoutState

    init() {
        layoutState = .grid
        layout = DisplaySwitchLayout(staticCellHeight: 200,
                                     nextLayoutStaticCellHeight: 200,
                                     layoutState: layoutState)
    }
}

