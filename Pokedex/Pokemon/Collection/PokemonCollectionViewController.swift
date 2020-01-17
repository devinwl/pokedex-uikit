//
//  PokemonCollectionViewController.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-13.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PokemonCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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

        self.collectionView!.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView!.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        self.title = "Pokédex"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Table View", style: .plain, target: self, action: #selector(handleTableViewButtonTapped))

    }
    
    @objc func handleTableViewButtonTapped() {
        let nextViewController = PokemonTableViewController()
        UIView.transition(with: self.navigationController!.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.navigationController?.setViewControllers([nextViewController], animated: false)
        }, completion: nil)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPokemon.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        guard let pokemonCell = cell as? PokemonCollectionViewCell else { return cell }
        
        let pokemon = allPokemon[indexPath.row]
        pokemonCell.pokemon = pokemon
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pokemon = allPokemon[indexPath.row]
        self.navigationController?.pushViewController(PokemonViewController(pokemon), animated: true)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 4
        return CGSize(width: width, height: width)
    }
}
