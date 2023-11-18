//
//  PokemonResult.swift
//  PokeDex
//
//  Created by Diggo Silva on 18/11/23.
//

import Foundation

// MARK: - PokemonResult
struct PokemonResult: Codable {
    let attack, defense: Int
    let description: String
    let evolutionChain: [EvolutionChain]?
    let height, id: Int
    let imageURL: String
    let name, type: String
    let weight: Int
    let pokemonResultDefense: Int?

    enum CodingKeys: String, CodingKey {
        case attack, defense, description, evolutionChain, height, id
        case imageURL = "imageUrl"
        case name, type, weight
        case pokemonResultDefense = "defense:"
    }
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let id, name: String
}

typealias PokemonResults = [PokemonResult?]
