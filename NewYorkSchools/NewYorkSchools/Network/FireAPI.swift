//
//  FireAPI.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/16/23.
//

import Foundation
import Alamofire
class APIFetchHandler:ObservableObject{
    @Published var schoolArray = [SchoolModel]()
    static let sharedInstance = APIFetchHandler()
    func fetchAPIData(){
        let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json";
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode([SchoolModel].self, from: data!)
                    
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
