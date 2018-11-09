//
//  PokemonStat.swift
//  Pokedex
//
//  Created by Jared Egan on 10/30/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit

/// A class representing a stat belonging to a Pokemon. e.g. Speed, Defense
class PokemonStat {

    // MARK: - Properties

    /// The base value of the stat.
    let baseStat: Int

    /// The effort points (EV) the Pokémon has in the stat
    let effort: Int

    /// The name of the stat
    let name: String

    // MARK: - Init
    init(jsonDictionary: [String: Any]) {
        self.baseStat = jsonDictionary["base_stat"] as! Int
        self.effort = jsonDictionary["effort"] as! Int

        let statDictionary = jsonDictionary["stat"] as! [String: Any]

        self.name = statDictionary["name"] as! String
    }

    init(baseStat: Int, effort: Int, name: String) {
        self.baseStat = baseStat
        self.effort = effort
        self.name = name
    }

    // MARK: - Functions

    /// A get-only property that should return a nice string describing the stat
    var displayString: String {
        // TODO: Make this better so the tests pass
        
        
        return name
    }
}
