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
    @State private var searchText = ""
    @State  var schoolList = [SchoolModel]()
    var body: some View {
        VStack{
            NavigationStack{
                Image("newYork")
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("\(searchText)")
                    .navigationTitle("School")
                    .searchable(text: $searchText)
                List(schoolList){school in
                    NavigationLink{//wheere the navi will take the codeline
                        SchoolDetails(schoolID: school.id, schoolName: school.school_name ?? "", schoolLocation: school.location ?? "")
                    }label: {
                        schoolCell(schoolName: school.school_name ?? "")
                    }.foregroundColor(.blue)
                        .hoverEffect(.highlight)
                        .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                }
            }
        }.background(.white)
        .onAppear(){
            Task{
                do{
                    let schoolList = try await networkManager.getDataApi(url: URL(string: endpoint.schoolListEndPoint)!, modelType: [SchoolModel].self)
                    DispatchQueue.main.async {
                        self.schoolList = schoolList
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
