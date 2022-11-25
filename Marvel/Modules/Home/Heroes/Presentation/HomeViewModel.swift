//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Combine

class HomeViewModel: HomeViewModelProtocol {
    var heroesList: [HeroModel]
    private var dataManager: ServiceProtocol
    private let repository: HomeRepository
    
    init(dataManager: ServiceProtocol = Service.shared, repository: HomeRepository = HomeRepository()) {
        self.dataManager = dataManager
        self.repository = repository
        self.heroesList = [HeroModel]()
    }
    
    func loadData(_ completion: @escaping(_ ready: Bool) -> Void) -> AnyCancellable {
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
    
    func numberOfRows() -> Int {
        return self.heroesList.count
    }
    
    func getHeroInfoBy(index: Int) -> HeroModel{
        return self.heroesList[index]
    }
    
    func getHeroDetailInfo(index: Int, _ completion: @escaping(_ hero: HeroDetailModel?) -> Void) -> AnyCancellable {
        //Cambiar por llamada al detalle del super heroe
        superheroDetail(index: index).sink { completionn in
            if case .failure(let error) = completionn {
                print(error)
                print(completionn)
            }
            completion(nil)
        }
        receiveValue: { hero in
            if let hero = hero{
                completion(hero)
            }
            
            completion(nil)
        }
    }
    
}

// Calls to repository
extension HomeViewModel {
    func getHeroes() -> AnyPublisher<[HeroModel]?, NetworkError>{
        let result = self.repository.fetchSuperheroes()
        
        return result.tryMap { heroes in
            guard let heroes = heroes else{
                return nil
            }
            
            return heroes
        }
        .mapError({
            _ in NetworkError(initialError: .explicitlyCancelled, backendError: nil)
        })
        .eraseToAnyPublisher()
    }
    
    func superheroDetail(index: Int) -> AnyPublisher<HeroDetailModel?, NetworkError>{
        let result = self.repository.superheroDetail(heroId: heroesList[index].id)
        
        return result.tryMap { heroes in
            guard let heroes = heroes else{
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
