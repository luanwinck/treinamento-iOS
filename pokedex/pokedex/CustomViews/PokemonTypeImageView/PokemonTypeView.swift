//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Luan Winck on 12/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTypeView: UIView {
    
    let nibName = "PokemonTypeView"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func config(type: PokemonType) {
        self.image.image = type.icon
        self.label.text = type.rawValue.capitalized
        self.contentView.backgroundColor = type.color
    }
}
