//
//  CombineData.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/21/23.
//

import Foundation
import Combine
class PopulateListOfCombine:ObservableObject{
    var networkManagers2:NetworkManager2 = NetworkManager2()
    @Published var planetsList:[PlanetDetailList] = []
    @Published var filiteredplanetsList:[PlanetDetailList] = []
    var customError:NetworkError?
    var apiURL:String = "https://swapi.dev/api/planets/?format=json"
    var isErrorOccured:Bool = false
    var cancalable = Set<AnyCancellable>()
    func populateLists(urlString:String){
        do{
            guard URL(string: urlString) != nil else{ throw NetworkError.urlError}
            let planetList: () =  networkManagers2.getApi(url: URL(string: "https://swapi.dev/api/planets/?format=json")!, modelType: planetList.self)
                .sink { completion in
                    switch completion{
                    case .finished:
                        print("in finshed cases")
                    case .failure(let error):
                        switch error{
                        case is DecodingError:
                            self.customError = NetworkError.parsingError
                        case NetworkError.serverNotFoundError:
                            self.customError = NetworkError.serverNotFoundError
                        case is URLError:
                            self.customError = NetworkError.urlError
                        case NetworkError.parsingError:
                            self.customError = NetworkError.parsingError
                        default:
                            self.customError = NetworkError.dataNotFound
                        }
                        self.customError = NetworkError.serverNotFoundError
                        print(error.localizedDescription)
                    }
                }receiveValue: { pl in
                    self.planetsList = pl.results
                    self.filiteredplanetsList = pl.results
                }.store(in: &cancalable)
        }catch{
          
        }
        
    }
    func cancelOnGoingTask(){
        cancalable.first?.cancel()
    }
    func searching(searchText:String){
        if searchText.isEmpty{
            self.filiteredplanetsList = self.planetsList.sorted(by: {$0.name < $1.name})
        }else{
            let newlist = planetsList.filter({planet in
                      planet.name.localizedCaseInsensitiveContains(searchText)
                  })
                  self.filiteredplanetsList = newlist.sorted(by: {$0.name < $1.name})
              }
        }
      
}
