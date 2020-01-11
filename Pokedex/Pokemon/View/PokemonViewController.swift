//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-10.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    let pokemon: Pokemon
    let pokemonView: PokemonView
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: UIScreen.main.bounds)
        
        return view
    }()
    
    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        self.pokemonView = PokemonView(pokemon)

        super.init(nibName: nil, bundle: nil)
        
        self.title = pokemon.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = scrollView
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        view.addSubview(pokemonView)
        
        self.pokemonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pokemonView.widthAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.widthAnchor),
            
            pokemonView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            pokemonView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            pokemonView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            pokemonView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
        
    }

}
