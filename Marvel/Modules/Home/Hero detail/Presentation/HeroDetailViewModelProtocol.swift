//
//  HeroDetailViewModelProtocol.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation

protocol HeroDetailViewModelProtocol {
    var hero: HeroDetailModel! { get set }
    func comicsNum() -> Int
    func getComicDataBy(index: Int) -> MSDetailItem?
}
