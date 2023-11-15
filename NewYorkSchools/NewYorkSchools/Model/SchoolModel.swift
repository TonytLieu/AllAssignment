//
//  SchoolModel.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/10/23.
//

import SwiftUI

struct SchoolModel: Codable, Identifiable{
    let id :String
    let school_name, overviewParagraph, location, phoneNumber: String?
    let faxNumber, schoolEmail, requirement11, requirement21: String?

    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case school_name
        case overviewParagraph = "overview_paragraph"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
    }
}

