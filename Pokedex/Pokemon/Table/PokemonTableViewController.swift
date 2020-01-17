//
//  PokemonTableViewController.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-09.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    let allPokemon: [Pokemon] = {
        var list = [Pokemon]()
        
        let bulbasaur = Pokemon(name: "Bulbasaur", description: "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.", smallImage: UIImage(imageLiteralResourceName: "BulbasaurSmall"), bigImage: UIImage(imageLiteralResourceName: "BulbasaurBig"))
        
        let charmander = Pokemon(name: "Charmander", description: "Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.", smallImage: UIImage(imageLiteralResourceName: "CharmanderSmall"), bigImage: UIImage(imageLiteralResourceName: "CharmanderBig"))
        
        let squirtle = Pokemon(name: "Squirtle", description: "After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.", smallImage: UIImage(imageLiteralResourceName: "SquirtleSmall"), bigImage: UIImage(imageLiteralResourceName: "SquirtleBig"))
        
        list.append(bulbasaur)
        list.append(charmander)
        list.append(squirtle)
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.description())
        
        self.title = "Pokédex"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Collection View", style: .plain, target: self, action: #selector(handleCollectionViewButtonTapped))
    }
    
    @objc func handleCollectionViewButtonTapped() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let nextViewController = PokemonCollectionViewController(collectionViewLayout: layout)
        UIView.transition(with: self.navigationController!.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.navigationController?.setViewControllers([nextViewController], animated: false)
        }, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.description(), for: indexPath)
        guard let pokemonCell = cell as? PokemonTableViewCell else { return cell }
        
        let pokemon = allPokemon[indexPath.row]
        pokemonCell.pokemon = pokemon
        return pokemonCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let pokemon = allPokemon[indexPath.row]
            self.navigationController?.pushViewController(PokemonViewController(pokemon), animated: true)
        }
}


