//
//  Schedulers.swift
//  Recipe
//
//  Created by Firat Yenidunya on 20.12.2021.
//

import RxSwift

class Schedulers {
    static var main: SchedulerType {
        return MainScheduler.asyncInstance
    }
}
