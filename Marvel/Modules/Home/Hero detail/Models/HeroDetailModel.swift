//
//  HeroDetailModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import Foundation

// MARK: - MSCharacter
struct HeroDetailModel: Codable {
    let id: Int
    let name, description: String?
    let modified: String?
    let thumbnail: ThumbnailModel
    let resourceURI: String?
    let comics, series: MSDetail?
    let stories: MSDetail?
    let events: MSDetail?
    let urls: [MSURLElement]?
    
    func url() -> URL?  {
        if let url = URL(string: "\(thumbnail.path).\(thumbnail.extension)") {
            return url
        }
        
        return nil
    }
}

// MARK: - Detail
struct MSDetail: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [MSDetailItem]?
    let returned: Int?
}

// MARK: - DeatilItem
struct MSDetailItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

// MARK: - URLElement
struct MSURLElement: Codable {
    let type: String?
    let url: String?
}
