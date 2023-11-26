//
//  MapViewModel.swift
//  Maps
//
//  Created by Tony Lieu on 11/25/23.
//

import Foundation
import Foundation
import Combine
class GetApiWithCore:ObservableObject{
    var networkManagers2:NetworkManager2 = NetworkManager2()
    @Published var mapsList:[MapsList] = []
    @Published var placeList:[Place] = []
    var customError:NetworkError?
    var apiURL:String = "https://jsonplaceholder.typicode.com/users"
    var isErrorOccured:Bool = false
    var cancalable = Set<AnyCancellable>()
    func populateLists(urlString:String){
        do{
            guard URL(string: urlString) != nil else{ throw NetworkError.urlError}
            networkManagers2.getApi(url: URL(string:   apiURL)!, modelType: MapsList.self)
                .receive(on: RunLoop.main)
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
                    
                    self.mapsList = [pl].self
                }.store(in: &cancalable)
        }catch{
            
        }
        
    }
    func cancelOnGoingTask(){
        cancalable.first?.cancel()
    }
}
