//
//  theaterName.swift
//  Assginment6
/*
1.Constructor Injection
2.Property Injection
3.Method Injection
4.Access Specifiers, modifiers
5. Error handling in iOS and different ways, create your own error and function to throw it and localised description for error*/
//  Created by Tony Lieu on 10/26/23.
//

import Foundation
public class Theater{//public can be call outside of the file
    internal var theaterName:String
    internal var address:String
    var masterPassword:Int
    init(theaterName: String, address: String, masterPassword: Int) {
        self.theaterName = theaterName
        self.address = address
        self.masterPassword = masterPassword
    }
    func checkPassword(pass:Int,mA:AuthorizedMovie)throws->Bool{//method injection
        if mA.movieIsAvaible{
            switch pass{
            case  1234:
                print("password accepted")
                return true
            default:
                throw DataError.wrongPassword
            }
        }else{
            print("no movie avaible")
            return mA.movieIsAvaible
        }
            
    }
}
