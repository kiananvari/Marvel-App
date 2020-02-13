//
//  Comics.swift
//  Marvel-Hero
//
//  Created by Work on 1/19/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct Comics : Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}
