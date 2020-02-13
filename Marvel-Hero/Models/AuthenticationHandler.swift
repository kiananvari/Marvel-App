//
//  AuthenticationHandler.swift
//  Marvel-Hero
//
//  Created by Work on 1/12/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

class AuthenticationHandler {
    
    var HashManager = HashGenerator()
    
    static func getAccessAddress(firstPart : String) -> String{
        

        let finalUrl = "\(firstPart)\(HashGenerator.getAccess())"
        


        return finalUrl
        
    
    }
    
}
