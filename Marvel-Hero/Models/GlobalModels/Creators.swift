//
//  CreatorsCo.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}
