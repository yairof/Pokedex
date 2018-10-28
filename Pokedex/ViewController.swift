//
//  ViewController.swift
//  Pokedex
//
//  Created by Yairo Fernandez on 10/23/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemon: [Pokemon]?
    
//    for pokemonJSON in pokemonJSONArray {
//        let pokemonAppend = Pokemon(jsonDictionary: pokemonJSON)
//        pokemonArray.append(object)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        callApi()
        
        }
        // Do any additional setup after loading the view, typically from a nib.
    
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
                    self.tableView.reloadData()
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = pokemon?.count {
            return numberOfRows
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonList") as! CustomTableViewCell
        
        // string formatting
        if let currentPokemon = pokemon?[indexPath.row] {
            cell.lbl.text = String(format: "%d. %@", indexPath.row + 1,currentPokemon.name.capitalized)
        }
        
        
        return cell
    }

}

