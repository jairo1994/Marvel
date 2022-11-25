//
//  HeroModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation

struct MSResult<T: Codable>: Codable {
    let code: Int?
    let status, message: String?
    let data: MSDataClass<T>?
    
    init(){
        self.code = nil
        self.status = nil
        self.message = nil
        self.data = nil
    }
}

// MARK: - DataClass
struct MSDataClass <T: Codable>: Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
}


// MARK: - HeroModel
struct HeroModel: Codable {
    let id: Int
    let name, description: String
    let thumbnail: ThumbnailModel
    
    func url() -> URL?  {
        if let url = URL(string: "\(thumbnail.path).\(thumbnail.extension)") {
            return url
        }
        
        return nil
    }
    
    init(){
        id = 0
        name = ""
        description = ""
        thumbnail = ThumbnailModel()
    }
}

struct ThumbnailModel: Codable {
    let path: String
    let `extension`: String
    
    init() {
        path = ""
        `extension` = ""
    }
}
