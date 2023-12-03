//
//  LoginPageView.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//

import Foundation
class LoginViewModel{
    func loginVal(emailID:String?, passwordinput:String?)-> Bool{
            var isValid = false
            guard let emailID = emailID else{
            return isValid
        }
        guard let passwordinput = passwordinput else{
            return isValid
        }
        let isValidPassword = passwordinput.count >= 6
        let emailRegex = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //                  abc           @ gmail          .com
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid =  emailPredicate.evaluate(with: emailID)
        //need to validate the user
        isValid = isEmailValid && isValidPassword
        return isValid
    }
}
