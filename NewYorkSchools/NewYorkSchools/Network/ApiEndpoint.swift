//
//  ApiEndpoint.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/10/23.
//

import Foundation
actor ApiEndpoints{
    static var shared = ApiEndpoints()
    var schoolListEndPoint = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    private init(schoolListEndPoint: String = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") {
        self.schoolListEndPoint = schoolListEndPoint
    }
}
