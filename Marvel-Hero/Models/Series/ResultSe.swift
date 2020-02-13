//
//  ResultSe.swift
//  Marvel-Hero
//
//  Created by Work on 2/9/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct ResultSe: Codable {
    let id: Int?
    let title: String?
    let resultDescription: String?
    let resourceURI: String?
    let urls: [URLElement?]
    let startYear, endYear: Int?
    let rating: String?
    let type: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let comics, events: Characters?
    let next, previous: Next?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, urls, startYear, endYear, rating, type, modified, thumbnail, creators, characters, stories, comics, events, next, previous
    }
}
