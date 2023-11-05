//
//  ErrorCodes.swift
//  Assginment6
//
//  Created by Tony Lieu on 10/26/23.
//

import Foundation
//error codes for theater
enum DataError:Error{
    case wrongPassword
    case wrongAddresss
    case seatNotAvaiable
}
extension DataError:LocalizedError{
    var errorDescription: String?{
        switch self{
        case .wrongPassword:
            return  NSLocalizedString("wrong Password", comment: "")
        case .wrongAddresss:
            return NSLocalizedString("wrong Address", comment: "")
        case .seatNotAvaiable:
            return NSLocalizedString("Seat not avavible", comment: "")
        }
    }
   
}
