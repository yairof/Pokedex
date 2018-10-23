//
//  ViewController.swift
//  Pokedex
//
//  Created by Yairo Fernandez on 10/23/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var pokemon: [Pokemon]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        callApi()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func callApi() {
        Alamofire.request("https://pokeapi.co/api/v2/pokemon/").responseJSON { (response) in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value as? [String: Any] {
                if let pokemonJSONArray = json["results"] as? [[String: Any]] {
                    var result = [Pokemon]()
                    
                    for pokemonJSON in pokemonJSONArray {
                        let object = Pokemon(jsonDictionary: pokemonJSON)
                        result.append(object)
                    }
                    self.pokemon = result
                    self.displayPokemonList()
                }
                
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    
    func displayPokemonList() {
        guard let unwrappedPokemon = pokemon else {
            return
        }
        
        // TODO: Populate some view
        for aPokemon in unwrappedPokemon {
            print(aPokemon.name)
        }
        
    }

}

