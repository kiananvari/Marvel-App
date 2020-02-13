//
//  HashGenerator.swift
//  Marvel-Hero
//
//  Created by Work on 1/28/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

class HashGenerator {
    
    
    static func getAccess() -> String {
        
        let timestamp = Int(NSDate().timeIntervalSince1970 * 1000)
        //      Static Keys From Marver Developers Portal
        let publicKey = "da17de630ee01367caf99f049072dd7e"
        let privateKey = "91deddd110232c38ef2856da98bcb1cbbb668522"
        let hashStyle =  "\(timestamp)\(privateKey)\(publicKey)"
        
        let access = "ts=\(timestamp)&apikey=\(publicKey)&hash=\(hashStyle.md5())"
        
        return access
        
        
    }
    
}
