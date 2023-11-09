//
//  ContentView.swift
//  PokemonFirstSwiftUI
//
/*
 Screen 1- NavigationSplitView

 2. Taking any example of your choice show the usage of bellow Property Modifiers in your current project

  1.Statex
  2.Bindingx
  3.StateObject
  4.ObsevedObjectx
  5.ObservableObjectx
  6.Envoirnmentx
  7.EnvoirnmentObjectx
  8.Appstoragex
  9.Publishedx

 3.Create a new Pokemon app in SwiftUI with MVVM architecture
 Use async await and show list of pokemnons on one screen
 And Details on another screen,
 API Endpoint-https://api.pokemontcg.io/v2/cards?page=1&pageSize=15



 */
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    @State  var screenTitile: String = "Welcome To The World Of Pokemon"
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.verticalSizeClass) var vSizeClass
    var body: some View {
       
        NavigationStack{
            VStack {
                if(vSizeClass == . regular){
                    Text(screenTitile).foregroundStyle(colorScheme == .light ? .red: .green)
                }else{
                    HStack{
                        Text(screenTitile).foregroundStyle(colorScheme == .light ? .red: .green)
                    }
                }
                NavigationLink{
                    PokemonTableView()
                    }label: {
                        Image("pokeball")
                     }
                HStack{
                    NavigationLink("DetailView"){
                        DetailScreen()
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    NavigationLink("SwiftUI"){
                        detailScreen2(changeTitle: $screenTitile)
                    }
                }
                    }
        }
        
        .padding()
        
    }
}

#Preview {
    ContentView()
}
