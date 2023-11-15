//
//  CheckSchoolSAT.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/14/23.
//

import Foundation

class CheckSchoolSAT{
    var scoresList: [Scores] = []
    var nM = NetworkManager()
    var real:Bool = false
    func checkID(id:String) async{
        do{
            guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(id)") else { return
            }
            print(url)
            
            let scoreList = try await nM.getDataApi(url: url, modelType: [Scores].self)
            print(scoreList)
            DispatchQueue.main.async {
                self.scoresList = scoreList
            }
        }catch {
            print(error.localizedDescription)
        }
        if scoresList.isEmpty{
            real = false
        }
        else{
            real = true
        }
    }
}
