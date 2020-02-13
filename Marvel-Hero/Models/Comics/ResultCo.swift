//
//  ResultCo.swift
//  Marvel-Hero
//
//  Created by Work on 2/9/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct ResultCo: Codable {
    let id, digitalID: Int?
    let title: String?
    let issueNumber: Int?
    let variantDescription, resultDescription: String?
    let modified: String?
    let isbn, upc, diamondCode, ean: String?
    let issn, format: String?
    let pageCount: Int?
    let textObjects: [TextObject?]
    let resourceURI: String?
    let urls: [URLElement?]
    let series: Series?
    let variants: [Series?]
    let collections: [Series?]
    let collectedIssues: [Series?]
    let dates: [DateElement?]
    let prices: [Price?]
    let thumbnail: Thumbnail?
    let images: [Thumbnail?]
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let events: Characters?
    
    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription
        case resultDescription = "description"
        case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
    }
}
