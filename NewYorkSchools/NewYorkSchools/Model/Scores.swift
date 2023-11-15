//
//  Scores.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/14/23.
//

import Foundation

struct Scores:Codable, Identifiable{
    var id:String
    var school_name,numOfTaker,SATCR,SATM,SATW:String?

    enum CodingKeys: String, CodingKey{
        case id = "dbn"
        case school_name
        case numOfTaker = "num_of_sat_test_takers"
        case SATCR = "sat_critical_reading_avg_score"
        case SATM = "sat_math_avg_score"
        case SATW = "sat_writing_avg_score"
    }
}
