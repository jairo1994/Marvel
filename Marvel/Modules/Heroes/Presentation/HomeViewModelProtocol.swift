//
//  HomeViewModelProtocol.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    var heroesList: ResponseHeroModel { get set }
    func loadData(_ completion: @escaping(_ ready: Bool) -> Void) -> AnyCancellable
    func getHeroes() -> AnyPublisher<ResponseHeroModel?, NetworkError>
}
