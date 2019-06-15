//
//  PokemonListInteractor.swift
//  Pokedex
//
//  Created by Luan Winck on 15/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class PokemonListInteractor {
    
    private let requestMaker = RequestMaker()
    
    private weak var output: PokemonListInteractorOutput?
    
    init(output: PokemonListInteractorOutput) {
        self.output = output
    }

}

extension PokemonListInteractor: PokemonListInteractorInput {
    func fetchData() {
        requestMaker.make(withEndpointUrl: .list) { (pokemonList: PokemonList) in
            self.output?.dataFetched(pokemonList)
        }
//
//        requestMaker.make(withEndpointUrl: .details(query: "5")) { (pokemon: Pokemon) in
//            print(pokemon)
//        }
    }
}
