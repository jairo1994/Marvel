//
//  BaseRequest.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Combine
import Alamofire
import CryptoSwift

protocol ServiceProtocol {
    func getRequest<T : Decodable>(request: String, type: T.Type) -> AnyPublisher<DataResponse<T, NetworkError>, Never>
}

class Service: ServiceProtocol {
    static let shared: ServiceProtocol = Service()
    private init() { }
    
    var parameters: Parameters {
        let ts = "\(Int((Date().timeIntervalSince1970 * 1000.0).rounded()))"
        let publicKey: String = RequestConfig.publicKey
        let privateKey: String = RequestConfig.privateKey
        
        return Parameters(dictionaryLiteral: ("apikey", publicKey), ("ts", ts), ("hash", "\(ts)\(privateKey)\(publicKey)".md5()))
    }
    
    func getRequest<T : Decodable>(request: String, type: T.Type) -> AnyPublisher<DataResponse<T, NetworkError>, Never> {
        let url = URL(string: "\(RequestConfig.apiURL)/\(request)")!
        
        return AF.request(url,
                          method: .get,
                          parameters: parameters,
                          headers: HTTPHeaders([HTTPHeader(name: "Accept", value: "*/*")]))
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap {
                        try? JSONDecoder().decode(BackendError.self, from: $0)
                    }
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


