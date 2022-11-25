//
//  HeroModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation

// MARK: - BaseResponseModel
struct BaseResponseModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: ResponseHeroModel
}

// MARK: - ResponseHeroModel
struct ResponseHeroModel: Codable {
    let offset, limit, total, count: Int
    let results: [HeroModel]
    
    init() {
        self.offset = 0
        self.limit = 0
        self.total = 0
        self.count = 0
        self.results = [HeroModel]()
    }
}

// MARK: - HeroModel
struct HeroModel: Codable {
    let id: Int
    let name: String
}
