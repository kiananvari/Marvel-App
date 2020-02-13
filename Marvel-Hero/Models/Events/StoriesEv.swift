//
//  StoriesCo.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation
struct StoriesEv: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemEv]
    let returned: Int
}
