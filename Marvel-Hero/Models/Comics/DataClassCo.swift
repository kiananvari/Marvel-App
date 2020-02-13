//
//  DataClassCo.swift
//  Marvel-Hero
//
//  Created by Work on 2/9/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct DataClassCo: Codable {
    let offset, limit, total, count: Int
    let results: [ResultCo]
}
