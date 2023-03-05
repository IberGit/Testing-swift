//
//  ContentView.swift
//  Pokedex
//
//  Created by Damian on 5/3/23.
//

import SwiftUI

struct PokedexView: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.pokemons, id: \.name) { pokemon in
                    Text(pokemon.name.capitalized)
                }
            }
            .navigationTitle("Pokemons")
        }
        .onAppear{
            viewModel.getPokemons()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
