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
    
    func comicsNum() -> Int {
        guard let items = hero.comics?.items else {
            return 0
        }
        
        return items.count
    }
    
    func getComicDataBy(index: Int) -> MSDetailItem? {
        guard let items = hero.comics?.items else {
            return nil
        }
        
        return items[index]
    }
}
