//
//  ContentView.swift
//  FirstSwiftUIApp
//
/*
Propery Wrapper in SwifftUI
 they add exta meaning to variables
 1.state- any simple data types
 2.Binding-when you want to share data between 2 screens or children
 3.StatesObject
 4.ObeseverdObject
 6.ObseveaableObject
 7EviormentObject
 8.AppStorage
 9.Fetch- coredata
 */
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var emailID:String = ""
    @State var password:String = ""
    @State  var screenTitile: String = "welcome to DigiPokemon"
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.verticalSizeClass) var vSizeClass
    var body: some View {
     /*   if colorScheme == .light{
            Text(screenTitile).foregroundStyle(.red)
        }else{
            Text(screenTitile).foregroundStyle(.green)
        }*/
        if(vSizeClass == . regular){
            Text(screenTitile).foregroundStyle(colorScheme == .light ? .red: .green)
        }else{
            HStack{
                Text(screenTitile).foregroundStyle(colorScheme == .light ? .red: .green)
            }
        }
        NavigationStack{ //IOS 16.0
        //NavigationView{// less than IOS 16.0
            //all information need to wrap in VStack and HStack changes the strutrue of the from up down to side by side
    //this will adject view to the top
            containerView()
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            //.background(.red)
        }
    @ViewBuilder
    func containerView() -> some View{
        VStack(spacing: 20) {
            Image("dump")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .frame(maxWidth: .infinity)
            //padding is for space between items
            //.padding(100)
                .colorInvert()
            Text(screenTitile)
            TextField("Email", text: $emailID)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            /*Button("Login"){
                print("Login button tapped")
            }.buttonStyle(.bordered)
                .background(.orange)*/
            NavigationLink("Login"){
                ListScreen()
                    
            }.buttonStyle(.borderedProminent)
            NavigationLink("Collection"){
                Collection()
            }.buttonStyle(.borderedProminent)
            NavigationLink("ImageDisplay"){
               ImageDisplay()
            }.buttonStyle(.borderedProminent)
            NavigationLink("WebView"){
                    WebView()
            }.buttonStyle(.borderedProminent)
            NavigationLink("SwiftUI"){
                DetailScreen(changeTitle: $screenTitile)
            }
            Button("button"){
                screenTitile = "heello"
            }
            Spacer()//this will adject view to the top
        }
    }
    }
@ViewBuilder
func TabFo()->some View{
    TabView{
        ListScreen()
            .tabItem {  Image(systemName: "square.and.arrow.up")
                Text("1st tab") }
        Collection()
            .tabItem {  Image(systemName: "square.and.arrow.up")
                Text("2st tab") }
    }
}

#Preview {
    return ContentView()
}

