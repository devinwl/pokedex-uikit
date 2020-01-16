//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-13.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 1
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.5
        l.textAlignment = .center
        return l
    }()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(smallImage)
        
        NSLayoutConstraint.activate([
            smallImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),
            smallImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}