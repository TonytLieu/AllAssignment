//
//  PokemonTableView.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct PokemonListView: View {
    var nM = NetworkManager()
    let endpoint = ApiEndpoints.shared
    @EnvironmentObject var user:UserInfo
    @State var isErrorOccured:Bool = false
    var pLVM:PokemonListViewModel = PokemonListViewModel()
    @State var pokemonList = [Pokemon]()
    var body: some View {
        List(pokemonList) { pokemon in
            NavigationLink{
                DetailScreen(type: pokemon.types.first ?? "")
            }label: {
                pokemonCell(pokemonName: pokemon.name,type: pokemon.hp!,lvl: pokemon.id)
            }
            
        }
        .onAppear(){
            Task{
                do{
                    let pokemonList = try await nM.getDataApi(url: URL(string: endpoint.pokemomListEndPoint)!, modelType: PokemonData.self)
                    DispatchQueue.main.async {
                        self.pokemonList = pokemonList.data
                    }
                }catch {
                    print(error.localizedDescription)
                }
                if pLVM.customError  != nil{
                    isErrorOccured = true
                }
            }
        }.refreshable {
            await pLVM.getPokemonList(urlString: "https://api.pokemontcg.io/v2/cards?page=1&pageSize=15")
        } .alert(isPresented: $isErrorOccured) {
            Alert(title: Text(pLVM.customError?.localizedDescription ?? ""),
                  message: Text("Try Again"),
                  dismissButton: .default(Text("Okay")))
        }
    }
    /*  A.alert("Message", isPresented: $isErrorOccured){
     Alert(title: Text(pLVM.customError?.localizedDescription ?? ""),
     message: Text("Try Again!"),
     dismissButton: .default(Text("")))
     }*/
    
}
#Preview {
    PokemonListView().environmentObject(UserInfo())
}
