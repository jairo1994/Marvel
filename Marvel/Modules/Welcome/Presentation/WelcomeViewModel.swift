//
//  WelcomeViewModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import Foundation

class WelcomeViewModel: WelcomeViewModelProtocol {
    var welcomeList: [WelcomeModel]
    
    init(welcomeList: [WelcomeModel]) {
        self.welcomeList = welcomeList
    }
    
    func numberOfRows() -> Int {
        return welcomeList.count
    }
    
    func getInfoBy(index: Int) -> WelcomeModel{
        return welcomeList[index]
    }
}
