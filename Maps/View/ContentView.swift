//
//  ContentView.swift
//  Maps
//
//  Created by Tony Lieu on 11/23/23.
//
/*
 FE's Todays assignment 20
 A. Show the use of keychain
 B. Show coredata lightweight migration and relationship between multiple entities tabel between table and save data in new tabel

 C.
 Create new App in swiftUI which shows below things
 1.Screen 1- MapView
 2.Pin Over Map-MapMarker
 3.Use corelocation framework to show current region map
 4.This API has lat long data to show pins on Maps. https://jsonplaceholder.typicode.com/users.
 */

import SwiftUI
import MapKit
struct ContentView: View {
    //Span control the overlooking size of the map
    @StateObject var userLocation = UserLocationManager()
    var apiList = GetApiWithCore()
    @State var placesList:[Place] = []
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.3159, longitude:81.1496),span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    var somePlace = Place(name: "something", coordinate: CLLocationCoordinate2D(latitude: -37.3159, longitude:81.1496))
    var region:Binding<MKCoordinateRegion>?{
        guard let location = userLocation.location else{
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.3159, longitude:81.1496),span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)).getBinding()
        }
        let actualRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
        return actualRegion.getBinding()
    }
    var body: some View {
        VStack {
            //Map(coordinateRegion: $staticRegion ).ignoresSafeArea()
            if let region = region{
               // Map(coordinateRegion: $staticRegion ).ignoresSafeArea()
                ForEach(placesList) { list in
                }
                Map(coordinateRegion: region, annotationItems:
                                        [somePlace]){place in
                    MapMarker(coordinate: place.coordinate)
                                }
            }
        }.onAppear(){
            apiList.mapsList.forEach { placess in
                var somep = Place(name: placess.name, coordinate: CLLocationCoordinate2D(latitude: Double(placess.address.geo
                    .lat)!, longitude:Double(placess.address.geo
                        .lng)!))
                placesList.append(somep)
            }
           
            
        }
        .padding()
    }
}
    

#Preview {
    ContentView()
}
