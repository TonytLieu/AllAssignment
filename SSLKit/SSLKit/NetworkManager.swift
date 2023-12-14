//
//  NetworkManager.swift
//  SSLKit
//
//  Created by Tony Lieu on 12/6/23.
//

import Foundation

class NetworkManager{
    //singleton
    static let shared = NetworkManager()
    var session:URLSession!
    
    private init(){
        session = URLSession.init(configuration: .ephemeral, delegate: nil, delegateQueue: nil)
    }
    func request<T:Decodable>(url: URL?, expecting:T.Type, completion: @escaping(_ data:T?, _ error: Error?->()){
        gurad let url else{
            print("cannot form url")
            return
        }
        
        session.dataTask(with: url){
            if let error{
                completion(nil, error)
                return
            }
            guard let data else{
                print("somthing went wrong")
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            } catch{
                completion(nil, error)
            }
        }
        
    }
}
