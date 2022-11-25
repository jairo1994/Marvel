//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Combine

class HomeViewModel: HomeViewModelProtocol {
    var heroesList: ResponseHeroModel
    private var dataManager: ServiceProtocol
    private let repository: HomeRepository
    
    init(dataManager: ServiceProtocol = Service.shared, repository: HomeRepository = HomeRepository()) {
        self.dataManager = dataManager
        self.repository = repository
        self.heroesList = ResponseHeroModel()
    }
    
    func loadData(_ completion: @escaping(_ ready: Bool) -> Void) -> AnyCancellable{
        getHeroes()
            .sink { completionn in
                if case .failure(let error) = completionn {
                    print(error)
                    print(completionn)
                }
                completion(false)
            }
            receiveValue: { heroes in
                if let heroes = heroes {
                    self.heroesList = heroes
                    completion(true)
                }
                
                completion(false)
            }
    }
    
}

// Calls to repository
extension HomeViewModel {
    func getHeroes() -> AnyPublisher<ResponseHeroModel?, NetworkError>{
        let result = self.repository.fetchSuperheroes()
        
        return result.tryMap { heroes in
            guard let heroes = heroes?.data else{
                return nil
            }
            
            return heroes
        }
        .mapError({
            _ in NetworkError(initialError: .explicitlyCancelled, backendError: nil)
        })
        .eraseToAnyPublisher()
    }
    
}
