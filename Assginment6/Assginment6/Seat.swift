//
//  Seat.swift
//  Assginment6
//
//  Created by Tony Lieu on 10/26/23.
//

import Foundation

open class Seat{// can be access throught the file and modual
    var seatNumber:Double
    var avaible:Bool
    var mA: AuthorizedMovie?//propery injection
    init(seatNumber: Double, avaible: Bool) {
        self.seatNumber = seatNumber
        self.avaible = avaible
    }
    func seatavaible()throws->Bool{
        guard let mA = mA else{
            throw DataError.seatNotAvaiable
        }
        if avaible{
            print("seat is available")
            return true
        }else{
            throw DataError.seatNotAvaiable
        }
    }
}
