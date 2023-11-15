//
//  SchoolDetails.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/10/23.
//

import SwiftUI

struct SchoolDetails: View {
    var schoolID:String
    var schoolName:String
    var schoolLocation:String
   @State var scoresList: [Scores] = []
    var nM = NetworkManager()
    var body: some View {
        VStack{
            Text("\(schoolName)")
                .font(.title).bold()
                .multilineTextAlignment(.center)
            Text("_____________________________")
            Image("compass")
            Text("\(schoolLocation)")
                .font(.title).bold()
                .multilineTextAlignment(.center)
            Text("---_____________________________---")
            HStack{
                NavigationLink("SAT Requiment"){
                    //this button will take you to another scene
                    if ((scoresList.first?.SATCR?.isEmpty) != nil){
                        SATScore(schoolID: schoolID, scoresList: [Scores(id: schoolID)])
                    }else{
                        NoScoreAvaible()
                    }
                }.buttonStyle(.bordered)
                    .background(.blue)
                    .foregroundColor(.black)
            }
            Spacer()
        }.onAppear(){
            Task{
                do{
                    guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(schoolID)") else { return
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
    SchoolDetails(schoolID: "" ,schoolName: "",schoolLocation: "")
}
