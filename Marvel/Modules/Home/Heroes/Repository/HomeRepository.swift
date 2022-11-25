//
//  HomeRepository.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Combine

enum AppError: Error {
    case impossible
}

class HomeRepository: HomeRepositoryProtocol {
    func fetchSuperheroes() -> AnyPublisher<[HeroModel]?, NetworkError> {
        return Service.shared.getRequest(request: "characters", type: HeroModel.self)
            .tryMap {
                let result = $0.value?.data?.results
                return result?.filter({ !$0.thumbnail.path.contains("not_available") })
            }
            .mapError({
                _ in NetworkError(initialError: .explicitlyCancelled, backendError: nil)
            })
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func superheroDetail(heroId: Int) -> AnyPublisher<HeroDetailModel?, NetworkError> {
        return Service.shared.getRequest(request: "characters/\(heroId)", type: HeroDetailModel.self)
            .tryMap {
                return $0.value?.data?.results?.first
            }
            .mapError({
                _ in NetworkError(initialError: .explicitlyCancelled, backendError: nil)
            })
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
