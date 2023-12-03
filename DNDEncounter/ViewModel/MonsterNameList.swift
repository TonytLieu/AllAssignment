//
//  MonsterNameList.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//

import Foundation
import Combine
class MonsterNameList:ObservableObject{
    @Published var monsterList = [Monsters]()
    @Published var filiteredMonsterList = [Monsters]()
    var customError:NetworkError?
    var networkMangers2 = NetworkManager()
    var isErrorOccured:Bool = false
    var cancalable = Set<AnyCancellable>()
    var coreDataManager = CoreDataManage(context:PersistenceController.shared.container.viewContext)
    
    func populateLists(urlString:String){
        do{
            guard URL(string: urlString) != nil else{ throw NetworkError.urlError}
            networkMangers2.getApi(url: URL(string: urlString)!, modelType: [Monsters].self)
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
                    
                    self.monsterList = pl
                    self.getSQlitePath()
                    Task{
                        try await self.coreDataManager.clearAllRecords()
                        try await self.coreDataManager.saveDataIntoDatabase(list: self.monsterList)
                    }
                    // self.filiteredProductsList = pl.products
                    
                }.store(in: &cancalable)
        }catch{
            
        }
        
    }
    func cancelOnGoingTask(){
        cancalable.first?.cancel()
    }
    func searching(searchText:String){
                if searchText.isEmpty{
                    self.filiteredMonsterList = self.monsterList.sorted(by: {$0.name < $1.name})
                }else{
                    let newlist = monsterList.filter({monster in
                        monster.name.localizedCaseInsensitiveContains(searchText)
                    })
                    self.filiteredMonsterList = newlist.sorted(by: {$0.name < $1.name})
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
