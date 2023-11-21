//
//  CombineApi.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/21/23.
//

import Foundation
import Foundation
import Combine
protocol Networking2{
    //func getApi<T:Decodable>(url:URL, modelType:T.Type) async throws->T
    
    func getApi<T:Decodable>(url:URL, modelType:T.Type)-> AnyPublisher<T,Error>
}
class NetworkManager2:Networking2{
    func getApi<T>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
        //this will add a delay
        .delay(for: .seconds(5.0), scheduler: DispatchQueue.main)
        .map{$0.data}
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
        
    }
    
//    func getApi<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
//        do{
//            let (data,_) = try await URLSession.shared.data(from: url)
//            let parsedData = try JSONDecoder().decode(modelType, from: data)
//
//            return parsedData
//        }catch{
//            throw error
//        }
    }
