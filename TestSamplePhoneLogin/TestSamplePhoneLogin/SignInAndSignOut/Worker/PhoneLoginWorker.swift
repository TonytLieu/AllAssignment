//
//  PhoneLoginWorker.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/12/23.
//

import SwiftUI

import FirebaseAuth
protocol PhoneLoginWork{
    //this should sent data to presenter
  func StartPhoneLogin(phoneNumber: String, verificationID:String, completion: @escaping (Bool)->Void)
    
  func SignIn(verificationID:String)
}

class PhoneLoginWorker:PhoneLoginWork{
    static let shared = PhoneLoginWorker()
    
    private var verificationID:String?
    
    public var sof:Bool = false
    
    func StartPhoneLogin(phoneNumber: String, verificationID:String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil){ verificationID, error in
            guard let verificationID = verificationID, error == nil else{
                
                completion(false)
                return
            }
            
            self.verificationID = verificationID
            self.SignIn(verificationID: verificationID)
            
            completion(true)
        }
    }
    func SignIn(verificationID:String){
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationID
        )
        Auth.auth().signIn(with: credential){result, error in
            print(result ?? "none")
            if(result != nil){
                self.sof = true
            }
            print(error ?? "none")
        }
        
    }
}
