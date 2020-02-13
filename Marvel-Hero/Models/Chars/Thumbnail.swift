//
//  Thumbnail.swift
//  Marvel-Hero
//
//  Created by Work on 1/19/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct Thumbnail : Codable {
    let path: String?
    let thumbnailExtension: Extension?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
