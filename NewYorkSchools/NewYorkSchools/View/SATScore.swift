//
//  SATScore.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/13/23.
//

import SwiftUI

struct SATScore: View {
    var schoolID:String = ""
    @State var scoresList: [Scores]
    var nM = NetworkManager()
    var body: some View {
        Text("SAT Score")
            .multilineTextAlignment(.center)
            .font(.largeTitle)
        Text("____________________________")
        Text("requirement")
       
        VStack{
            List(scoresList){score in
                NavigationLink("Critical Reading and Thinking"){
                    //this button will take you to another scene
                    CTRScore(sATCTR: score.SATCR ?? "")
                   
                }
                NavigationLink("Math"){
                    //this button will take you to another scene
                    MathScore(sATMath:  score.SATM ?? "")
                }
                NavigationLink("Writing"){
                    //this button will take you to another scene
                    WritingScore(sATWriting:  score.SATW ?? "")
                }
                
            }
            Spacer()
            
            
        }.onAppear(){
            Task{
                do{
                    guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(schoolID)") else {
                        return
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
            }
        }
    }
}

#Preview {
    SATScore(schoolID: "", scoresList: [])
}
