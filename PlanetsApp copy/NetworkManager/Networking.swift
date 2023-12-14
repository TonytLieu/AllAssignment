//
//  Networking.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//

import Foundation
import Combine
protocol Networking{
    func getApi<T:Decodable>(url:URL, modelType:T.Type) async throws->T
    
    //func getApi<T:Decodable>(url:URL, modelType:T.Type) async throws-> AnyPublisher<T,Error>
}
class NetworkManager:Networking{
    //    func getApi<T>(url: URL, modelType: T.Type) async throws -> AnyPublisher<T, Error> where T : Decodable {
    //        return URLSession.shared.dataTaskPublisher(for: url)
    //        .map{$0.data}
    //        .decode(type: T.self, decoder: JSONDecoder())
    //        .eraseToAnyPublisher()
    //
    //    }
    
    func getApi<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            
            return parsedData
        }catch{
            throw error
        }
    }
}
