//
//  UserManager.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import Foundation

class UserManager {
    private let userDefaults = UserDefaults.standard
    private let user = "user"
    
    static var shared: UserManager{
        let userManager = UserManager()
        return userManager
    }
    
    func setIfUserShouldSeeWelcomeView(_ should: Bool) {
        guard var userModel = Session.user else {
            return
        }
        
        userModel.shouldSeeWelcomeView = should
        Session.user = userModel
    }
}
