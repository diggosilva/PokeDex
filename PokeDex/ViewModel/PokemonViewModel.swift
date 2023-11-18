//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import Foundation

class PokemonViewModel {
    
    static let shared = PokemonViewModel()
    
    private init() {
        
    }
    
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

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let parsedDataString = dataString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
