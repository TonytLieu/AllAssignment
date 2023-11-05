import UIKit

var greeting = "Hello, playground"

enum dataError:Error{
    case wrongNumber
    case wrongName
    case nowWorking
}
func error(code:Int)throws->Bool{
    switch code{
    case 1:
        throw dataError.wrongNumber
    case 2:
        throw dataError.wrongName
    default:
        throw dataError.nowWorking
    }
}
extension dataError{
    var errorCodeDescribe: String?{
        switch self{
                
        case .wrongNumber:
            return NSLocalizedString("wrong Number", comment: "")
        case .wrongName:
            return NSLocalizedString("wrong Name", comment: "")
        case .nowWorking:
            return NSLocalizedString("not working", comment: "")
        }
    }
    
}
