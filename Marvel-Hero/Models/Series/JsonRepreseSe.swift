//
//  JsonRepreseSe.swift
//  Marvel-Hero
//
//  Created by Work on 2/9/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct JsonRepreseSe: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassSe
}
