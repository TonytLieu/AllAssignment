//
//  PokemonTableView.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct PokemonListView: View {
    var nM = NetworkManager()
    @EnvironmentObject var user:UserInfo
    @State var pokemonList = [Pokemon]()
    var body: some View {
        
        VStack{
            List(pokemonList) { pokemon in
                NavigationLink{
                    DetailScreen(type: pokemon.types.first ?? "")
                }label: {
                    pokemonCell(pokemonName: pokemon.name,type: pokemon.hp!,lvl: pokemon.id)
                }
                
            }
        }
        .onAppear(){
            Task{
                do{
                    let pokemonList = try await nM.getDataApi(url: URL(string: ApiEndpoints.pokemomListEndPoint)!, modelType: PokemonData.self)
                    DispatchQueue.main.async {
                        self.pokemonList = pokemonList.data
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }.refreshable {
            do{
                let pokemonList = try await nM.getDataApi(url: URL(string: ApiEndpoints.pokemomListEndPoint)!, modelType: PokemonData.self)
                DispatchQueue.main.async {
                    self.pokemonList = pokemonList.data
                }
            }catch {
                print(error.localizedDescription)
            }
            
        }
        
    }
}

#Preview {
    PokemonListView().environmentObject(UserInfo())
}
