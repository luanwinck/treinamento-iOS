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
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewCenterVerticallyConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pokemontTypeView: PokemonTypeView!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfig()
        view.accessibilityIdentifier = "detailView"
        
        if let pokemonType = self.pokemon?.types.first {
            self.pokemontTypeView.config(type: pokemonType)
        }
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
                
                self.animatePokemonImageViewToTop()
            }
        }
        
    }
    
    func animatePokemonImageViewToTop() {
        DispatchQueue.main.async {
            self.pokemonImageView.layer.removeAllAnimations()
            
            self.pokemonImageViewCenterVerticallyConstraint.priority = UILayoutPriority(rawValue: 900)
            self.pokemonImageViewTopConstraint.priority = UILayoutPriority(rawValue: 999)
            
            UIView.animate(withDuration: 1, animations: {
                self.pokemonImageView.alpha = 1
                self.pokemonImageViewHeightConstraint.constant = 80
                self.pokemonImageViewWidthConstraint.constant = 80
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func loadingPokemonAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.pokemonImageView.alpha = 0.2
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
            
            self.pokemonImageView.loadImage(from: pokemon.image)
        }
    }
    
}
