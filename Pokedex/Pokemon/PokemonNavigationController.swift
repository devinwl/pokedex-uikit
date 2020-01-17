//
//  PokemonNavigationController.swift
//  Pokedex
//
//  Created by Devin Lumley on 2020-01-16.
//  Copyright © 2020 Devin Lumley. All rights reserved.
//

import UIKit

class PokemonNavigationController: UINavigationController, UIActionSheetDelegate {
    
    let optionMenu: UIAlertController = {
        let menu = UIAlertController(title: "Choose a view mode", message: nil, preferredStyle: .actionSheet)
        
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: nil)
    }
    
    func showActionSheet() {
        self.present(self.optionMenu, animated: true, completion: nil)
    }
    
    func handleTableViewAction() {
        print("Table view")
    }
    
    func handleCollectionViewAction() {
        print("Collection view")
    }
}
