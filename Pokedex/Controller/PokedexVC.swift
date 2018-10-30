//
//  ViewController.swift
//  Pokedex
//
//  Created by Yairo Fernandez on 10/23/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit
import Alamofire

class PokedexVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemonArray: [Pokemon]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
                    self.pokemonArray = [Pokemon].init(result[0...801])
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
        guard let unwrappedPokemon = pokemonArray else {
            return
        }
        
        // TODO: Populate some view
        for aPokemon in unwrappedPokemon {
            print(aPokemon.name)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pokemonAlert = pokemonArray?[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alertController = UIAlertController(title: "Hint", message: "You have selected row \(String(describing: pokemonAlert?.name))", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pokemonArray = pokemonArray {
            return pokemonArray.count
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonList") as! CustomTableViewCell
        
        // string formatting
        if let currentPokemon = pokemonArray?[indexPath.row] {
            cell.lbl.text = String(format: "%@. %@", currentPokemon.numberFromURL(), currentPokemon.name.capitalized)
        }
        
        
        return cell
    }

}

