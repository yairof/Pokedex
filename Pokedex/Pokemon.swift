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
    
    init(jsonDictionary: [String: Any]) {
        name = jsonDictionary["name"] as! String
        detailUrl = jsonDictionary["url"] as! String
    }

    init(name: String, detailUrl: String) {
        self.name = name
        self.detailUrl = detailUrl
    }
    
    
}
