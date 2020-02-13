//
//  Result.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation
import UIKit

struct ResultSt: Codable {
    let id: Int?
    let title, resultDescription: String?
    let resourceURI: String?
    let type: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let creators: CreatorsSt?
    let characters, series, comics, events: CharactersSt?
    let originalIssue: OriginalIssueSt?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, type, modified, thumbnail, creators, characters, series, comics, events, originalIssue
    }
}
