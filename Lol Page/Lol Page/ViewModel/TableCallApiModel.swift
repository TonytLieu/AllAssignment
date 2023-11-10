//
//  TableCallApiModel.swift
//  Lol Page
//
//  Created by Tony Lieu on 11/9/23.
//

import Foundation
import UIKit
class TableCallApiModel{
    func CallAPI(tables:UITableView,userList: [User]){
        var nM = NetworkManager()
        guard var url = URL(string: "https://reqres.in/api/users") else{return}
       nM.getDataFromAPI(url: url, modelType: UserModel.self) { results in
            switch results{
            case .success(let userData):
               var userList = userData.data
                DispatchQueue.main.async {
                    tables.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func readTheDataFromJSONFile(tables:UITableView, userList: [User]){
        let bundle = Bundle(for: TableViewController.self)
        let url = bundle.url(forResource: "usersList", withExtension: "json")
        guard let url = url else{return}
        do{
            let rawData = try Data(contentsOf: url)
           let results = try JSONDecoder().decode(UserModel.self, from: rawData)
           var userList = results.data
            DispatchQueue.main.async {
                tables.reloadData()
            }
            print(results)
        }catch{
            print(error.localizedDescription)
        }
        
    }

}
