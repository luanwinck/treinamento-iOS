//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Luan Winck on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var gradientView: GradientView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadingPokemonAnimation()
        self.requestPokemon()
    }
    
    func requestPokemon() {
        if let pokemon = self.pokemon {
            let requestMaker = RequestMaker()
            
            requestMaker.make(withEndpointUrl: .details(query: pokemon.id)) { (pokemon: Pokemon) in
                
            }
        }
        
    }
 
    func loadingPokemonAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.imageView.alpha = 0.2
        })
        
        
//        UIView.animate(withDuration: 1, animations: {
//            self.imageView.alpha = self.imageView.alpha == 1 ? 0.2 : 1
//        }) { _ in
//            self.loadingPokemonAnimation()
//        }
    }
    
    func initialConfig() {
        if let pokemon = self.pokemon {
            self.gradientView.startColor = pokemon.types.first?.color ?? .black
            self.gradientView.endColor = pokemon.types.first?.color?.lighter() ?? .white
            
            self.imageView.loadImage(from: pokemon.image)
        }
    }
    
}
