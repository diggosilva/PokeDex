//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import Foundation

protocol PokemonViewModelDelegate: AnyObject {
    func reloadData()
}

final class PokemonViewModel {
    private let service = Service.shared
    public var pokemons: [PokemonResult] = []
    
    weak var delegate: PokemonViewModelDelegate?
    
    func getPokemon() {
        service.fetchPokemon { [weak self] result in
            guard let self else { return }
            self.pokemons = result
            self.delegate?.reloadData()
        }
    }
}
