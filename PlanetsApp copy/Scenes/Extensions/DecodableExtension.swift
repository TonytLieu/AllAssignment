//
//  DecodableExtension.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 12/7/23.
//

import Foundation
//this is a networkManager to get the api
extension Bundle{
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
