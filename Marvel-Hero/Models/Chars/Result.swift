//
//  Result.swift
//  Marvel-Hero
//
//  Created by Work on 1/19/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct Result: Codable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}
