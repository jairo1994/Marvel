//
//  WelcomeViewModelProtocol.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import Foundation

protocol WelcomeViewModelProtocol {
    var welcomeList: [WelcomeModel] { get set }
    func numberOfRows() -> Int
    func getInfoBy(index: Int) -> WelcomeModel
}
