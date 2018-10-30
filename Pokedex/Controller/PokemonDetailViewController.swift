//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Jared Egan on 10/30/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    // MARK: - Properties
    let myPokemon: Pokemon

    // MARK: - View Properties
    @IBOutlet var testLabel: UILabel!

    // MARK: - Init
    init(pokemon: Pokemon) {
        self.myPokemon = pokemon

        super.init(nibName: "PokemonDetailViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = myPokemon.name
    }

}
