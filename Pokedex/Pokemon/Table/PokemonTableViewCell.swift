//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-10.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    var label = UILabel()
    var smallImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pokemon: Pokemon! {
        didSet {
            label.text = pokemon.name
            smallImage.image = pokemon.smallImage
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(smallImage)
        
        NSLayoutConstraint.activate([
            smallImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            smallImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            
            label.leadingAnchor.constraint(equalTo: smallImage.trailingAnchor, constant: 5),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
