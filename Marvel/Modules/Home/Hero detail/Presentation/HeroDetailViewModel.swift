//
//  HeroDetailViewModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation

class HeroDetailViewModel: HeroDetailViewModelProtocol {
    var hero: HeroDetailModel!
    
    init(hero: HeroDetailModel) {
        self.hero = hero
    }
}
