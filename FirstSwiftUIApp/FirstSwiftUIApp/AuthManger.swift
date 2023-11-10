//
//  AuthManger.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/9/23.
//
/*
 Singleton DesignPattern It ensure that a class can only have one instance it provides global access to that instance this can be achived by making the constructior of the singleton class as privite
 let authmanger = authmanger will not work because it is private
 let authmanage = authmanger.shared will let it work even in private
 authmanger.doLogin(token:"sdasd")
 authmanger.logout()
 */
import Foundation

final class AuthManger{
    static let shared = AuthManger()
    var authToken:String = ""
    var isLoggedIn = false
    
    private init(){
        
    }
    func doLogin(token:String){
        authToken = token
        isLoggedIn = true
    }
    func logout(){
        authToken = ""
        isLoggedIn = false
    }
}
