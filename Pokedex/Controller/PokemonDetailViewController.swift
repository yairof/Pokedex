//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Jared Egan on 10/30/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit
import Alamofire

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
        
        callDetailApi()
        updateView()

    }

    // MARK: - PokemonDetailViewController methods
    
    func callDetailApi() {
        Alamofire.request(myPokemon.detailUrl).responseJSON { (response) in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let pokemonDetail = response.result.value as? [String: Any] {
                print("JSON: \(pokemonDetail)") // serialized json response
                self.myPokemon.populateFromDetailJSONDictionary(json: pokemonDetail)
                self.updateView()
            }
            
        }
    
    }
    
    func updateView() {
        if myPokemon.hasDetails {
//            self.testLabel.text = "\(self.myPokemon.name)\nHeight: \()"
            var pokeDescription = ""
            pokeDescription.append(self.myPokemon.name)
            pokeDescription.append("\n")
            pokeDescription.append("Height: \(self.myPokemon.height)\n")
            pokeDescription.append("Weight: \(self.myPokemon.weight)\n")
            self.testLabel.text = pokeDescription
        } else {
            // Details haven't been loaded
            self.testLabel.text = self.myPokemon.name
        }
    }
}
