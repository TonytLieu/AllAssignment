//
//  ContentView.swift
//  PokemonFirstSwiftUI
//
/*
 1.In existing a new Pokemon app in SwiftUI with MVVM architecture
  Add Pull to refresh functionalityx

 2.Convert existing UIKit project to MVVM of login and api call from MVC to MVVM architecture
 MVC - Model View Controller
 MVVM- Model View ViewModel

 3.Write test cases covering all scenario's for login validation function


 4. Also show use of Singleton design pattern
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
                    PokemonListView()
                    }label: {
                        Image("pokeball")
                     }
                HStack{
                    NavigationLink("DetailView"){
                        DetailScreen(type: "", lvl: "")
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
