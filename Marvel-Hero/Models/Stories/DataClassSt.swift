//
//  DataClass.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct DataClassSt: Codable {
    let offset, limit, total, count: Int
    let results: [ResultSt]
}
