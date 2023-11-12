//
//  NetworkError.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/12/23.
//

import Foundation

enum NetworkError:Error{
    case urlError
    case serverNotFoundError
    case dataNotFound
    case parsingError
}

extension NetworkError:LocalizedError{
    var errorDescription: String?{
        switch self{
            
        case .urlError:
            return NSLocalizedString("API url is incorrect", comment: "urlError")
        case .dataNotFound:
            return NSLocalizedString("API could not find data", comment: "data not Found" )
        case .serverNotFoundError:
            return NSLocalizedString("API server can't be reach", comment: "server not found")
        case .parsingError:
            return NSLocalizedString("parsing Error in API", comment: "parsing Error")
        default:
            return NSLocalizedString("Unknown Error", comment: "404")
        }
    }
}

