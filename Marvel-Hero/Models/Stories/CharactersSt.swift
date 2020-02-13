//
//  Characters.swift
//  Marvel-Hero
//
//  Created by Work on 2/8/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation
import UIKit

struct CharactersSt: Codable {
    let available: Int
    let collectionURI: String
    let items: [OriginalIssueSt]?
    let returned: Int
}
