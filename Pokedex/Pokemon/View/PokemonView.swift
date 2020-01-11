//
//  PokemonView.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-10.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

class PokemonView: UIView {
    let pokemon: Pokemon
    
    lazy var bigImage: UIImageView = {
        let view = UIImageView(image: pokemon.bigImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pokemonDescription: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        label.text = pokemon.description
        
        return label
    }()

    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        super.init(frame: .zero)
        
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(bigImage)
        addSubview(pokemonDescription)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            bigImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            bigImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            bigImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            bigImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            pokemonDescription.topAnchor.constraint(equalTo: bigImage.bottomAnchor, constant: 20),
            pokemonDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pokemonDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            pokemonDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
