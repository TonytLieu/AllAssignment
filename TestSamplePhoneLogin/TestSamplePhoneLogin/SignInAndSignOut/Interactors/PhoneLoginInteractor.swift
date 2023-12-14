//
//  PhoneLoginInteractor.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/12/23.
//

import Foundation

import SwiftUI

import FirebaseAuth

protocol PhoneLoginBusinessLogic{
   // func loadPhoneLogin(sof:Bool) -> Bool
    func loadPhoneLogin(phoneNumber:String, VID:String)
}
class PhoneLoginInteractor: ObservableObject{
  var presenter: PhoneLoginPresentionLogic?
    var sof:Bool = false
}

extension PhoneLoginInteractor:PhoneLoginBusinessLogic{
    func loadPhoneLogin(phoneNumber: String, VID: String) {
        PhoneLoginWorker.shared.StartPhoneLogin(phoneNumber: phoneNumber, verificationID: VID) { sof in
            self.sof = sof
        }
        sof = PhoneLoginWorker.shared.sof
        }
    }
//    func loadPhoneLogin(request: PhoneLoginWorker){
//        var request = PhoneLoginWorker()
//        sof = request.sof
//        presenter?.present(respose: PhoneLoginInteractor().self)
//    }
    
