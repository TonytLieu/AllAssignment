//
//  FakeNetworkManager.swift
//  PokemonFirstSwiftUITests
//
//  Created by Tony Lieu on 11/12/23.
//

import Foundation
@testable import PokemonFirstSwiftUI
class FakeNetworkManager:Networking{
    func getDataApi<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let url = url else{throw NetworkError.urlError}
        do{
            let rawData = try Data(contentsOf: url)
            let results = try JSONDecoder().decode(modelType.self, from: rawData)
            print(results)
            return results
        }catch{
            throw NetworkError.dataNotFound
        }
        
    }
    
    
}
