//
//  ResultCo.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct ResultEv: Codable {
    let id: Int?
    let title, resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement?]
    let modified: String?
    let start, end: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: Characters?
    let stories: StoriesEv?
    let comics, series: Characters?
    let next, previous: Next?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, urls, modified, start, end, thumbnail, creators, characters, stories, comics, series, next, previous
    }
}
