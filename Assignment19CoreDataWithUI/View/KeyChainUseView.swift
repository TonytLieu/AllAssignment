//
//  KeyChainUseView.swift
//  Assignment19CoreDataWithUI
//
//  Created by Tony Lieu on 11/23/23.
//

import SwiftUI

struct KeyChainUseView: View {
    @State var savedInfo:String = "None"
    var body: some View {
        VStack(spacing:20){
            Text(savedInfo)
            Button("Save info into Keychain"){
                saveDataIntoKeyChain(value: "123456", forKey: "myPassword")
            }.buttonStyle(.borderedProminent)
            Button("get info into Keychain"){
                savedInfo = GetDataIntoKeyChain(forKey: "myPassword")
            }.buttonStyle(.borderedProminent)
        }
    }
    
    func saveDataIntoKeyChain(value:String, forKey:String){
        if let rawData = value.data(using: .utf8){
            let query:[String:Any] = [
                kSecClass as String:kSecClassGenericPassword,
                kSecAttrAccount as String: forKey,
                kSecValueData as String: rawData
            ]
            SecItemAdd(query as CFDictionary, nil)
            print("Data saved into KeyChain")
        }
    }
    func GetDataIntoKeyChain(forKey:String)->String{
            let query:[String:Any] = [
                kSecClass as String:kSecClassGenericPassword,
                kSecAttrAccount as String: forKey,
                kSecReturnData as String: kCFBooleanTrue!,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]
        var dataTypeRef:AnyObject?
        let status:OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == noErr{
            if let data = dataTypeRef as? Data, let result = String(data: data, encoding: .utf8){
                print("Data get from KeyChain")
                savedInfo = result
                return result
            }
        }
        return "error getting value"
    }
    
}

#Preview {
    KeyChainUseView()
}
