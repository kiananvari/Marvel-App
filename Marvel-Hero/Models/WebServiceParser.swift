//
//  WebServiceParser.swift
//  Marvel-Hero
//
//  Created by Work on 1/11/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import Foundation
class WebServiceParser {
    
   static func parsCharacters(req : URLRequest , complimatin  : @escaping (JSONReprese)->Void) {
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
      
            if let data = data {
                
                do {
                    
                    let result = try JSONDecoder().decode(JSONReprese.self, from: data)

                    complimatin(result)
                    
                } catch let error {
                    
                    print("Error : data parser : \(error)")
                    
                }
                
            }else {
                
                print("data is not valid")
                
            }
            
            }.resume()
    }
    
    static func parsComics(req : URLRequest , complimatin  : @escaping (JsonRepreseCo)->Void) {
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if let data = data {
                
                do {
                    
                    let result = try JSONDecoder().decode(JsonRepreseCo.self, from: data)
                    
                    complimatin(result)
                    
                } catch let error {
                    
                    print("Error : data parser : \(error)")
                    
                }
                
            }else {
                
                print("data is not valid")
                
            }
            
            }.resume()
    }
    
    static func parsEvents(req : URLRequest , complimatin  : @escaping (JsonRepreseEv)->Void) {
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if let data = data {
                
                do {
                    
                    let result = try JSONDecoder().decode(JsonRepreseEv.self, from: data)
                    
                    complimatin(result)
                    
                } catch let error {
                    
                    print("Error : data parser : \(error)")
                    
                }
                
            }else {
                
                print("data is not valid")
                
            }
            
            }.resume()
    }
    
    static func parsStories(req : URLRequest , complimatin  : @escaping (JsonRepreseSt)->Void) {
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if let data = data {
                
                do {
                    
                    let result = try JSONDecoder().decode(JsonRepreseSt.self, from: data)
                    
                    complimatin(result)
                    
                } catch let error {
                    
                    print("Error : data parser : \(error)")
                    
                }
                
            }else {
                
                print("data is not valid")
                
            }
            
            }.resume()
    }
    
    static func parsSeries(req : URLRequest , complimatin  : @escaping (JsonRepreseSe)->Void) {
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if let data = data {
                
                do {
                    
                    let result = try JSONDecoder().decode(JsonRepreseSe.self, from: data)
                    
                    complimatin(result)
                    
                } catch let error {
                    
                    print("Error : data parser : \(error)")
                    
                }
                
            }else {
                
                print("data is not valid")
                
            }
            
            }.resume()
    }
    
    
}
