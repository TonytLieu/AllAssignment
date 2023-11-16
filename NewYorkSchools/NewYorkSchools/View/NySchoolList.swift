//
//  ContentView.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/10/23.
//

import SwiftUI
import Alamofire

struct NySchoolList: View {
    var networkManager:NetworkManager = NetworkManager()
    let endpoint = ApiEndpoints.shared
    var nfire:APIFetchHandler = APIFetchHandler()
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
            //let schoolList = APIFetchHandler.sharedInstance.schoolArray
            //print(APIFetchHandler.sharedInstance.schoolArray
                let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json";
                AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                    .response{ resp in
                        switch resp.result{
                        case .success(let data):
                            do{
                                let jsonData = try JSONDecoder().decode([SchoolModel].self, from: data!)
                                DispatchQueue.main.async {
                                               self.schoolList = jsonData
                                           }

                            } catch {
                                print(error.localizedDescription)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
           
//            Task{
            
//                do{
//                   // let schoolList = try await networkManager.getDataApi(url: URL(string: endpoint.schoolListEndPoint)!, modelType: [SchoolModel].self)
//                    DispatchQueue.main.async {
//                        self.schoolList = schoolList
//                    }
//                }catch {
//                    print(error.localizedDescription)
//                }
//            }
        }
    }
}


#Preview {
    NySchoolList()
}
