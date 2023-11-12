//
//  ContentView.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/10/23.
//

import SwiftUI

struct NySchoolList: View {
    var networkManager:NetworkManager = NetworkManager()
    let endpoint = ApiEndpoints.shared
    @State  var schoolList = [SchoolModel]()
    var body: some View {
        VStack{
            Image("newYork")
            Button("Test"){
            }
            List(schoolList){school in
                NavigationStack{
                    NavigationLink{//wheere the navi will take the codeline
                        SchoolDetails(schoolName: school.schoolName, schoolLocation: school.location, requirment1: school.requirement11, requirment2: school.requirement21)
                    }label: {
                        schoolCell(schoolName: school.schoolName)
                    }
                }
            }
        }.onAppear(){
                Task{
                    do{
                        let schoolList = try await networkManager.getDataApi(url: URL(string: endpoint.schoolListEndPoint)!, modelType: SchoolModel.self)
                        DispatchQueue.main.async {
                            self.schoolList.append(schoolList)
                        }
                    }catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }


#Preview {
    NySchoolList()
}
