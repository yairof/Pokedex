//
//  Pokemon.swift
//  Pokedex
//
//  Created by Yairo Fernandez on 10/23/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import Foundation

class Pokemon {
    let name: String
    let detailUrl: String
    var height: Double = 0
    var weight: Double = 0
    var baseExperience: Double = 0
    var id: Int = 0
    var hasDetails: Bool = false
    
    init(jsonDictionary: [String: Any]) {
        name = jsonDictionary["name"] as! String
        detailUrl = jsonDictionary["url"] as! String
    }
    
    init(name: String, detailUrl: String) {
        self.name = name
        self.detailUrl = detailUrl
    }
    
    func numberFromURL() -> String {
        //TODO
        // Sample:  https://pokeapi.co/api/v2/pokemon/1/
        
        var result = detailUrl.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        result = result.replacingOccurrences(of: "/", with: "")
        return result
    }
    
    func populateFromDetailJSONDictionary(json: [String: Any]) {
        self.height = json["height"] as! Double
        self.weight = json["weight"] as! Double
        self.baseExperience = json["base_experience"] as! Double
        self.id = json["id"] as! Int
        self.hasDetails = true
    }
    
}
