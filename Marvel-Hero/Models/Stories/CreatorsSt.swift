//
//  Creators.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct CreatorsSt: Codable {
    let available: Int
    let collectionURI: String
    let items: [ItemSt]
    let returned: Int
}
