//
//  HomeRepositoryProtocol.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func fetchSuperheroes() -> AnyPublisher<BaseResponseModel?, NetworkError>
}
