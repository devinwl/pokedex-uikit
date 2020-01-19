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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
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
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor.systemBlue.cgColor
            } else {
                self.layer.borderColor = UIColor.systemGray5.cgColor
           }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(smallImage)
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        
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
