//
//  JSONReprese.swift
//  Marvel-Hero
//
//  Created by Work on 1/19/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

struct JSONReprese: Codable{
    
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass?
    
  
}
