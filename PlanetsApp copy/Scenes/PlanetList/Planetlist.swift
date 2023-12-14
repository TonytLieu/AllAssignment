//
//  Planetlist.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 12/10/23.
//

import SwiftUI

struct Planetlist: View {
    @State var planetsList = [PlanetDetailList]()
    var nM = NetworkManager()
    @State private var searchText = ""
    var apiURL:String = "https://swapi.dev/api/planets/?format=json"//this one is so i can change the url whenever i want to look at the next page
    var apiURL2:URL = URL(string: "https://swapi.dev/api/planets/?format=json")!
    //this var is to call to get the api
    //var plop:PopulateListOfPlanets = PopulateListOfPlanets()
    //statesObject let you use property in object
    @StateObject var cd:PopulateListOfCombine = PopulateListOfCombine()
    @StateObject var seachable:Searchingfilter
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
                    seachable.searching(searchText: newValue)
                }
        }.onAppear{//where the func to get the Json will appear
//            Task{
//                await plop.populateList()
//                planetsList = plop.planetsList
//            }
                
                  cd.populateLists(urlString: apiURL)
                  seachable.popular = cd
            
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
    Planetlist(seachable:Searchingfilter(popular: PopulateListOfCombine()))
}
