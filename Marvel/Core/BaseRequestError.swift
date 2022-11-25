//
//  BaseRequestError.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
