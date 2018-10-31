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
    /// The height of this Pokémon in decimetres.
    var height: Int = 0
    /// The weight of this Pokémon in hectograms.
    var weight: Int = 0
    var hasDetails: Bool = false
    /// The stats this Pokemon has. This will be `nil` until the details have been fetched.
    var stats: [PokemonStat]? = nil
    
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
        self.height = json["height"] as! Int
        self.weight = json["weight"] as! Int
        self.hasDetails = true

        // Get the array of stat dictionaries.
        // The type [[String: Any]] means "array of  [String: Any]" or "array of dictionaries, with String keys and values of "Any" type.
        if let statDictionaries = json["stats"] as? [[String: Any]] {

            var parsedStats = [PokemonStat]() // Array of `PokemonStat` objects
            for statDict in statDictionaries {
                let stat = PokemonStat(jsonDictionary: statDict)
                parsedStats.append(stat)
            }

            self.stats = parsedStats
        }
    }
    
}
