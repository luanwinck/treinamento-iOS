//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Luan Winck on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var primaryTypeImageView: UIImageView!
    @IBOutlet weak var secondaryTypeImageView: UIImageView!

    func config(with model: Pokemon) {
        // carregar imagens do pokemon
        pictureImageView.loadImage(from: model.image)
        
        nameLabel.text = model.name.capitalized
        idLabel.text = String(format: "#%03d", Int(model.id) ?? 0)
        primaryTypeImageView.image = model.types.first?.icon
        primaryTypeImageView.backgroundColor = model.types.first?.color
        
        if model.types.count > 1 {
            secondaryTypeImageView.image = model.types[1].icon
            secondaryTypeImageView.backgroundColor = model.types[1].color
            secondaryTypeImageView.isHidden = false
        } else {
            secondaryTypeImageView.isHidden = true
        }
    }
}
