//
//  NetworkManager.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//
import Foundation
import Combine
protocol Networking{
    func getApi<T:Decodable>(url:URL, modelType:T.Type)-> AnyPublisher<T,Error>
}
class NetworkManager:Networking{
    func getApi<T>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
        //this will add a delay
        // .delay(for: .seconds(5.0), scheduler: DispatchQueue.main)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
}
