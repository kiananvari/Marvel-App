//
//  SearchModel.swift
//  Marvel-Hero
//
//  Created by Work on 1/27/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

class SearchModel  {
    
    var apiManager = ApiHandler()
    var myResults = [Result]()
    var count : Int?
    var total : Int?
    
    static func getResultListById(heroId : Int , complimatin  : @escaping (JSONReprese)->Void){
        
        let FinalAddress = "https://gateway.marvel.com:443/v1/public/characters/\(heroId)?\(HashGenerator.getAccess())&offset=0"
        
                print(FinalAddress)
        ApiHandler.getSearchedCharacters(url: FinalAddress) { (result) in
            
            complimatin(result)
            //            print("total is :\(result.data.total)")
            //            print(result.data.count)
            
        }
        
    }
    
    
    static func getFavorietsChars(heroesId : [Int]? , complimatin  : @escaping ([JSONReprese])->Void){
        
        var results = [JSONReprese]()
       
        if let heroesId = heroesId {
            
            for item in heroesId {
                
                print("item is \(item)")
                let FinalAddress = "https://gateway.marvel.com:443/v1/public/characters/\(item)?\(HashGenerator.getAccess())&offset=0"
                
                print(FinalAddress)
                
                ApiHandler.getSearchedCharacters(url: FinalAddress) { (result) in
                    
            
                    results.append(result)
                    complimatin(results)
    
                }
                
            }
            
            
        }
        
        
     
        
    }
    

       static func getResultListByName(name : String , complimatin  : @escaping (JSONReprese)->Void){
        
        let FinalAddress = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(name)&\(HashGenerator.getAccess())&offset=0"
        
//        print(FinalAddress)
        ApiHandler.getSearchedCharacters(url: FinalAddress) { (result) in
            
            complimatin(result)
//            print("total is :\(result.data.total)")
//            print(result.data.count)
            
        }
        
    }
    
    
}
