//
//  Place.swift
//  Maps
//
//  Created by Tony Lieu on 11/26/23.
//

import Foundation
import CoreLocation
struct Place:Identifiable{
    var id = UUID()
    var name:String
    var coordinate:CLLocationCoordinate2D
}
