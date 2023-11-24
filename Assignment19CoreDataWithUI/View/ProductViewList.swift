//
//  ProductViewList.swift
//  Assignment19CoreDataWithUI
//
//  Created by Tony Lieu on 11/21/23.
//

import SwiftUI
import CoreData
struct ProductViewList: View {
    var nM = NetworkManager2()
    @State private var searchText = ""
    var apiURL:String = "https://dummyjson.com/products"//this one is so i can change the url whenever i want to look at the next page
    var apiURL2:URL = URL(string: "https://dummyjson.com/products")!
    var  cora = GetApiWithCore()
    //this var is to call to get the api
    //var plop:PopulateListOfPlanets = PopulateListOfPlanets()
    //statesObject let you use property in object
//    @StateObject var cd:PopulateListOfCombine = PopulateListOfCombine(networkManagers2: nM, coreDataManager: coreDataManager)
//    
   /* @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>*/
    //offline
    @FetchRequest(entity: ProductEnitiy.entity(), sortDescriptors:[])
    var results:FetchedResults<ProductEnitiy>
    let request:NSFetchRequest<ProductEnitiy> = ProductEnitiy.fetchRequest()
    var body: some View {
        Text("Products")
        NavigationStack{
            Button("Canel APi"){
                
            }
            List(results){pl in
                NavigationLink(pl.title ?? ""){
                }
            }.searchable(text: $searchText, placement: .automatic,prompt: "search for Products")
                .onChange(of: searchText) { oldValue, newValue in
                   
                }
        }.onAppear{//where the func to get the Json will appear
//            Task{
//                await plop.populateList()
//                planetsList = plop.planetsList
//            }
            cora.populateLists(urlString: apiURL)
            
        }.refreshable {
            //Task{
              //  await plop.populateList()
               // planetsList = plop.planetsList.sorted(by: {$0.name < $1.name})
            //}
           // cd.populateLists(urlString: apiURL)
        }
            
        }
    }
#Preview {
    ProductViewList()
}
