//
//  PopulateListOfPlanets.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//

import Foundation

class PopulateListOfPlanets:Observable{
var networkManagers:NetworkManager = NetworkManager()
   @Published var planetsList:[PlanetDetailList] = []
    var customError:NetworkError?
    var apiURL:String = "https://swapi.dev/api/planets/?format=json"
    var isErrorOccured:Bool = false
    
    func populateList() async{
        do{
            guard URL(string:apiURL) != nil else{throw NetworkError.urlError}
            let planetList =  try await networkManagers.getApi(url: URL(string: "https://swapi.dev/api/planets/?format=json")!, modelType: planetList.self)
            DispatchQueue.main.async {
                self.planetsList = planetList.results
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

