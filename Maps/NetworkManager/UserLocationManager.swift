//
//  UserLocationManager.swift
//  Maps
//
//  Created by Tony Lieu on 11/25/23.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit
@MainActor
class UserLocationManager:NSObject, ObservableObject{
    @Published var location:CLLocation?
    
    let locationManager = CLLocationManager()
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        //this will update automactic basic on user location
        locationManager.startUpdatingLocation()
    }
}

extension UserLocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocation location: [CLLocation]) {
        guard let location = location.last else{return}
        self.location = location
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus{
//        case .notDetermined: break
//            
//        case .restricted:
//            <#code#>
//        case .denied:
//            <#code#>
//        case .authorizedAlways:
//            <#code#>
//        case .authorizedWhenInUse:
//            <#code#>
//        @unknown default:
//            <#code#>
//        }
//    }
}
extension MKCoordinateRegion{
    func getBinding()-> Binding<MKCoordinateRegion>?{
        
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
