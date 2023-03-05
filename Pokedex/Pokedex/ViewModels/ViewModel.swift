//
//  ViewModel.swift
//  Pokedex
//
//  Created by Damian on 5/3/23.
//

import Foundation
/*
 
 count:1279
 next:"https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"
 previous:null
 results: [
    {
        "name": "pikachu",
        "url": "https://pokeapi.co/api/v2/pokemon/pikachu"
    },
 ]
 name:"bulbasaur"
 url:"https://pokeapi.co/api/v2/pokemon/1/"
 name:"ivysaur"
 url:"https://pokeapi.co/api/v2/pokemon/2/"
 
 */

final class ViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonDataModel] = []
    
    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("Pokemons \(pokemonDataModel)")
                DispatchQueue.main.async {
                    self.pokemons = pokemonDataModel.pokemons
                }
            }
        }.resume()
    }
}
