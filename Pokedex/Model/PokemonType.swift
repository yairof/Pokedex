//
//  PokemonTypes.swift
//  Pokedex
//
//  Created by Yairo Fernandez on 11/11/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit
// Class representing the typing of a pokemon
class PokemonType {

    let name: String
    let slot: Int

    /*
     {
      "slot": 2,
      "type": {
        "name": "poison",
        "url": "https://pokeapi.co/api/v2/type/4/"
      }
    },
    */
    init(jsonDictionary: [String: Any]) {
        self.slot = jsonDictionary["slot"] as! Int
        
        let typeDictionary = jsonDictionary["type"] as! [String: Any]
        
        
        self.name = typeDictionary["name"] as! String
    }
    
    
}
