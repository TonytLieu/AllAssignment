//
//  PhoneLoginPresenter.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/12/23.
//

import Foundation

protocol PhoneLoginPresentionLogic{
    func present(respose: PhoneLoginInteractor)
}

class PhoneLoginPresenter:ObservableObject{
    var view: PhoneLoginDisplayLogic?
    var sof:Bool = false
}

extension PhoneLoginPresenter:PhoneLoginPresentionLogic{
    func present(respose: PhoneLoginInteractor) {
        self.sof = respose.sof
        
    }
}
