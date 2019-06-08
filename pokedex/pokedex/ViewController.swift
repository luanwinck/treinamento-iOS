//
//  ViewController.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var requestMaker = RequestMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController {
    func testAPI() {
        requestMaker.make(withEndpointUrl: .list) { (pokemonList: PokemonList) in
            print(pokemonList)
        }
        
        requestMaker.make(withEndpointUrl: .details(query: "5")) { (pokemon: Pokemon) in
            print(pokemon)
        }
    }
}

