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
    func fetchSuperheroes() -> AnyPublisher<BaseResponseModel?, NetworkError> {
        return Service.shared.getRequest(request: "characters", type: BaseResponseModel.self)
            .tryMap {
                return $0.value
            }
            .mapError({
                _ in NetworkError(initialError: .explicitlyCancelled, backendError: nil)
            })
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
