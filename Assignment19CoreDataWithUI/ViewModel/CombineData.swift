//
//  CombineData.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/21/23.
//

import Foundation
import Combine
class GetApiWithCore:ObservableObject{
    var networkManagers2:NetworkManager2 = NetworkManager2()
    @Published var productsList:[Product] = []
    @Published var filiteredProductsList:[Product] = []
    var customError:NetworkError?
    var apiURL:String = "https://dummyjson.com/products"
    var isErrorOccured:Bool = false
    var cancalable = Set<AnyCancellable>()
    var coreDataManager = CoreDataManage(context:PersistenceController.shared.container.viewContext)
    
//    init(networkManagers2: NetworkManager2,  coreDataManager:CoreDataActions = CoreDataManage(context:PersistenceController.shared.container.viewContext)) {
//        self.networkManagers2 = networkManagers2
//        self.coreDataManager = coreDataManager
//        getSQlitePath()
//    }
//    deinit{
//        self.cancalable.removeAll()
//    }
    
    func populateLists(urlString:String){
        do{
            guard URL(string: urlString) != nil else{ throw NetworkError.urlError}
            networkManagers2.getApi(url: URL(string: "https://dummyjson.com/products")!, modelType: Walmart.self)
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
                    
                    self.productsList = pl.products
                    self.getSQlitePath()
                    Task{
                        try await self.coreDataManager.clearAllRecords()
                        try await self.coreDataManager.saveDataIntoDatabase(list: self.productsList)
                    }
                    self.filiteredProductsList = pl.products
                    
                }.store(in: &cancalable)
        }catch{
            
        }
        
    }
    func cancelOnGoingTask(){
        cancalable.first?.cancel()
    }
    func searching(searchText:String){
        if searchText.isEmpty{
            self.filiteredProductsList = self.productsList.sorted(by: {$0.title < $1.title})
        }else{
            let newlist = productsList.filter({planet in
                planet.title.localizedCaseInsensitiveContains(searchText)
            })
            self.filiteredProductsList = newlist.sorted(by: {$0.title < $1.title})
        }
    }
    func getSQlitePath(){
        guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else{
            return
        }
        let sqlitePath = url.appendingPathComponent("Assignment19CoreDataWithUIApp")
        print(sqlitePath.absoluteString)
    }
    
}
