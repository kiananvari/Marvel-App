//
//  DataClass.swift
//  Marvel-Hero
//
//  Created by Work on 1/19/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation
import UIKit

struct DataClass : Codable {
    let offset, limit, total, count: Int?
    let results: [Result]
}
