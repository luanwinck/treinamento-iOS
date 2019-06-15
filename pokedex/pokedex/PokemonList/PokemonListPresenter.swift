//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Luan Winck on 15/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListPresenter: NSObject {
    
    weak var view: PokemonListViewType?
        
    private var pokemonList = [Pokemon]()
    
    private lazy var interactor: PokemonListInteractorInput = PokemonListInteractor(output: self)
    
    private let pokemonKey = "Favorites.ids"
    
    private var favoriteIds: Set<String> {
        didSet {
            print(favoriteIds)
            UserDefaults.standard.set(Array(favoriteIds), forKey: pokemonKey)
        }
    }
    
    override init() {
        if let data = UserDefaults.standard.array(forKey: pokemonKey) as? [String] {
            self.favoriteIds = Set(data)
        } else {
            self.favoriteIds = []
        }
        
        super.init()
    }
    
    func pokemon(at index: Int) -> Pokemon {
        return pokemonList[index]
    }
    
    func swipe(at index: Int) {
        let pokemonId = self.pokemon(at: index).id
        
        guard self.favoriteIds.insert(pokemonId).inserted else {
            self.favoriteIds.remove(pokemonId)
            return
        }
    }
    
    func swipeAction(for index: Int) -> PokemonSwipeActions {
        return  self.favoriteIds.contains(pokemon(at: index).id) ? .removeFavorite : .addFavorite
    }
}

extension PokemonListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemon", for: indexPath)
        
        if let pokemonCell = cell as? PokemonTableViewCell {
            pokemonCell.config(with: self.pokemonList[indexPath.row])
        }
        
        return cell
    }
}

extension PokemonListPresenter {
    func fetchData() {
        self.interactor.fetchData()
    }
}

extension PokemonListPresenter: PokemonListInteractorOutput {
    func dataFetched(_ data: PokemonList) {
        self.pokemonList = data.pokemons
        
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
}
