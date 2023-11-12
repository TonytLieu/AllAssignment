//
//  PokemonListViewModel.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/12/23.
import Foundation
@MainActor
class PokemonListViewModel: Observable{
    var nM :Networking
    let endpoint = ApiEndpoints.shared
    var customError:NetworkError?
    var isErrorOccured:Bool = false
    @Published var pokemonList = [Pokemon]()
    init(nM: Networking = NetworkManager()) {
        self.nM = nM
    }
    func getPokemonList(urlString:String) async{
        do{
            guard let url = URL(string: urlString) else{throw NetworkError.urlError}
            let pokemonList = try await nM.getDataApi(url: url, modelType: PokemonData.self)
            DispatchQueue.main.async {
            self.pokemonList = pokemonList.data
            }
        }catch {
            switch error{
            case is DecodingError:
                customError = NetworkError.parsingError
            case NetworkError.serverNotFoundError:
                customError = NetworkError.serverNotFoundError
            case is URLError:
                customError = NetworkError.urlError
            case NetworkError.parsingError:
                customError = NetworkError.parsingError
            default:
                customError = NetworkError.dataNotFound
            }
            customError = NetworkError.serverNotFoundError
            print(error.localizedDescription)
        }
    }
}
