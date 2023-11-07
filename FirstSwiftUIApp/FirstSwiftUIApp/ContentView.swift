//
//  ContentView.swift
//  FirstSwiftUIApp
//
/*
 Create a new Project in SwiftUI  covering the below screens.
 Screen 1- Login Screen UI same design as we did in UIKitx
 ADD Multiple button for further screen navigation, Use Navigation Stack and NavigationLink for navigationsx
 Screen 2- Details screen. Take the same login screen and show its details here using,  SwiftUI componentsx
 Screen 3- List usage, show any array data of ur choice,x
 Screen 4 - Use Grid, LazyVGrid,LazyHGrid, to show the same data which we had shown in the table view, also navigate to the Screen 5 - Detail screen on the Grid item and click
 Screen 6 - show use of Image and AsyncImage
 Design cells for List and Grid screens separatelyx
 */
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var emailID:String = ""
    @State var password:String = ""
    var body: some View {
        NavigationStack{
            //all information need to wrap in VStack and HStack changes the strutrue of the from up down to side by side
            VStack(spacing: 20) {
                Image("dump")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .frame(maxWidth: .infinity)
                //padding is for space between items
                //.padding(100)
                    .colorInvert()
                Text("Hello, world Bubby")
                TextField("Email ", text: $emailID)
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
                Spacer()//this will adject view to the top
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            .background(.red)
        }
    }
}

#Preview {
    return ContentView()
}
