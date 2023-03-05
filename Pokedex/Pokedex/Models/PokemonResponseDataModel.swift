//
//  PokemonResponseDataModel.swift
//  Pokedex
//
//  Created by Damian on 5/3/23.
//

import Foundation

struct PokemonResponseDataModel: Decodable {
    let pokemons: [PokemonDataModel]
    enum CodingKeys: String, CodingKey {
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
