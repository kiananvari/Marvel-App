//
//  ApiHandler.swift
//  Marvel-Hero
//
//  Created by Work on 1/11/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation

class ApiHandler {
    
    var parserManager = WebServiceParser()
    
    
    static func getSearchedCharacters(url : String , complimatin  : @escaping (JSONReprese)->Void) {
        
        guard let getSearchedCharactersURL = URL.init(string: url) else {return}
        
        var getSearchedCharactersReq = URLRequest.init(url: getSearchedCharactersURL)
        getSearchedCharactersReq.httpMethod = "GET"
        
        //        print("url address is :\(finalApiAddress)")
        
        WebServiceParser.parsCharacters(req: getSearchedCharactersReq) { (result) in
            
            complimatin(result)
            
        }
    }
    
  
    static func getCharacters(offset : Int ,limit : Int, complimatin  : @escaping (JSONReprese)->Void) {
        
      let urlString = "https://gateway.marvel.com:443/v1/public/characters?"

        let apiAddress = AuthenticationHandler.getAccessAddress(firstPart: urlString)
        
        let finalApiAddress = "\(apiAddress)&offset=\(offset)&limit=\(limit)"
        
        guard let getCharactersURL = URL.init(string: finalApiAddress) else {return}
        
        var getCharactersReq = URLRequest.init(url: getCharactersURL)
        getCharactersReq.httpMethod = "GET"
        
        print("url address is :\(finalApiAddress)")
        
        print(finalApiAddress)
        WebServiceParser.parsCharacters(req: getCharactersReq) { (result) in
            
           complimatin(result)
            
        }
        
    }
    
    
    static func getComics(heroId : Int , offset : Int ,limit : Int, complimatin  : @escaping (JsonRepreseCo)->Void) {
        
        let urlString = "http://gateway.marvel.com/v1/public/characters/\(heroId)/comics?"
        
        let apiAddress = AuthenticationHandler.getAccessAddress(firstPart: urlString)
        
        let finalApiAddress = "\(apiAddress)&offset=\(offset)&limit=\(limit)"
        
        guard let getComicsURL = URL.init(string: finalApiAddress) else {return}
        
        var getComicsReq = URLRequest.init(url: getComicsURL)
        getComicsReq.httpMethod = "GET"
        
        print("url address is :\(finalApiAddress)")
        
        print(finalApiAddress)
        WebServiceParser.parsComics(req: getComicsReq) { (result) in
            
            complimatin(result)
            
        }
        
    }
    
    
    static func getEvents(heroId : Int , offset : Int ,limit : Int, complimatin  : @escaping (JsonRepreseEv)->Void) {
        
        let urlString = "http://gateway.marvel.com/v1/public/characters/\(heroId)/events?"
        
        let apiAddress = AuthenticationHandler.getAccessAddress(firstPart: urlString)
        
        let finalApiAddress = "\(apiAddress)&offset=\(offset)&limit=\(limit)"
        
        guard let getEventsURL = URL.init(string: finalApiAddress) else {return}
        
        var getEventsReq = URLRequest.init(url: getEventsURL)
        getEventsReq.httpMethod = "GET"
        
        print("url address is :\(finalApiAddress)")
        
        print(finalApiAddress)
        WebServiceParser.parsEvents(req: getEventsReq) { (result) in
            
            complimatin(result)
            
        }
        
    }
    
    static func getStories(heroId : Int , offset : Int ,limit : Int, complimatin  : @escaping (JsonRepreseSt)->Void) {
        
        let urlString = "http://gateway.marvel.com/v1/public/characters/\(heroId)/stories?"
        
        let apiAddress = AuthenticationHandler.getAccessAddress(firstPart: urlString)
        
        let finalApiAddress = "\(apiAddress)&offset=\(offset)&limit=\(limit)"
        
        guard let getStoriesURL = URL.init(string: finalApiAddress) else {return}
        
        var getStoriesReq = URLRequest.init(url: getStoriesURL)
        getStoriesReq.httpMethod = "GET"
        
        print("url address is :\(finalApiAddress)")
        
        print(finalApiAddress)
        WebServiceParser.parsStories(req: getStoriesReq) { (result) in
            
            complimatin(result)
            
        }
        
    }
    
    static func getSeries(heroId : Int , offset : Int ,limit : Int, complimatin  : @escaping (JsonRepreseSe)->Void) {
        
        let urlString = "http://gateway.marvel.com/v1/public/characters/\(heroId)/series?"
        
        let apiAddress = AuthenticationHandler.getAccessAddress(firstPart: urlString)
        
        let finalApiAddress = "\(apiAddress)&offset=\(offset)&limit=\(limit)"
        
        guard let getSeriesURL = URL.init(string: finalApiAddress) else {return}
        
        var getSeriesReq = URLRequest.init(url: getSeriesURL)
        getSeriesReq.httpMethod = "GET"
        
        print("url address is :\(finalApiAddress)")
        
        print(finalApiAddress)
        WebServiceParser.parsSeries(req: getSeriesReq) { (result) in
            
            complimatin(result)
            
        }
        
    }
    
    
    
}
