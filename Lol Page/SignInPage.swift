//
//  SignInPage.swift
//  Lol Page
//
//  Created by Tony Lieu on 10/30/23.
//

import Foundation
//this is to create a base of people to use as a control
struct AuthorizedPeople{
    var email:String
    var password:String
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }//this will go throught the check for the password to make sure it correct
    func checkPassword(pass:String)->Bool{
        if(self.password.elementsEqual(pass)){
            return true
        }else{
            return false
        }
    }
}

