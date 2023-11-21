//
//  ContentView.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//
/*
 FE's Todays assignment 18
 Assignment for today in SwiftUI with Combine Framework
 Create a Project in SwiftUI and Combine covering the below screens.
 API- Listing Screen https://swapi.dev/api/planets/
 In combine
 1.Show in List with planets info
 show below details for each cell,
 1. name
 2. population
 3. climate

 B.
 1. Implement search functionality
 2. Pull to Refresh
 3. Error handling
 4.Showing all other fields on details screen
 5.Add option on UI to cancel API request functionality

 C.
 Write UI Test for Previous Login screen app
 */

import SwiftUI

struct PlanetListView: View {
    @State var planetsList = [PlanetDetailList]()
    var nM = NetworkManager()
    @State private var searchText = ""
    var apiURL:String = "https://swapi.dev/api/planets/?format=json"//this one is so i can change the url whenever i want to look at the next page
    var apiURL2:URL = URL(string: "https://swapi.dev/api/planets/?format=json")!
    //this var is to call to get the api
    //var plop:PopulateListOfPlanets = PopulateListOfPlanets()
    //statesObject let you use property in object
    @StateObject var cd:PopulateListOfCombine = PopulateListOfCombine()
    var body: some View {
        Text("Planets")
        NavigationStack{
            Button("Canel APi"){
                cd.cancelOnGoingTask()
            }
            List(cd.filiteredplanetsList){pl in
                NavigationLink("Name: \(pl.name) | Climate: \(pl.climate) | Population: \(pl.population)") {
                    PlanetDetails(rotationPeriod: pl.rotationPeriod, orbitalPeriod: pl.orbitalPeriod, diameter: pl.diameter, gravity: pl.gravity, terrain: pl.terrain, surfaceWater: pl.surfaceWater, created: pl.created, edited: pl.edited)
                }
            }.searchable(text: $searchText, placement: .automatic,prompt: "search for planets")
                .onChange(of: searchText) { oldValue, newValue in
                    cd.searching(searchText: newValue)
                }
        }.onAppear{//where the func to get the Json will appear
//            Task{
//                await plop.populateList()
//                planetsList = plop.planetsList
//            }
                
                  cd.populateLists(urlString: apiURL)
            
        }.refreshable {
            //Task{
              //  await plop.populateList()
               // planetsList = plop.planetsList.sorted(by: {$0.name < $1.name})
            //}
            cd.populateLists(urlString: apiURL)
        }
            
        }
    }
#Preview {
    PlanetListView()
}
