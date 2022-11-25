//
//  UserViewModelProtocol.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import Foundation

protocol UserViewModelProtocol {
    var options: SectionSettingModel { get set}
    func numberOfRows() -> Int
    func getSettingInfoBy(index: Int) -> OptionSettingModel
}
