//
//  PokemonDetailViewModel.swift
//  PokeDex
//
//  Created by Diggo Silva on 13/12/23.
//

import UIKit

final class PokemonDetailViewModel {
    public var selectedPokemon: PokemonResult
    
    init(selectedPokemon: PokemonResult) {
        self.selectedPokemon = selectedPokemon
    }
}
