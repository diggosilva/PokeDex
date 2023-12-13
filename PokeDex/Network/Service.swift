//
//  Service.swift
//  PokeDex
//
//  Created by Diggo Silva on 12/12/23.
//

import Foundation

final class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func fetchPokemon(completion: @escaping([PokemonResult]) -> Void) {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data?.parseData(removeString: "null,"), error == nil else { return }
            do {
                let pokemonResult = try JSONDecoder().decode([PokemonResult].self, from: data)
                completion(pokemonResult)
            } catch {
                print("Erro ao decodificar: \(error.localizedDescription)")
            }
        }.resume()
    }
}
