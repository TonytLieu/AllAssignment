//
//  ContentView.swift
//  Assginment14
//
/*
 Screen 1- show use of Tabviewx
 Screen 2- Zstack - Take any image end point and load Image on to screen. Show Different labels and images on tis screenx
 Screen 3- web view in swiftUIx
 Screen 4- Geometric Reader viewx
 5. show UIkit to SwiftUI navigation
 6.SwiftUI to UIkit navigation
 */
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            firstPage()
        }
    }
}
@ViewBuilder
func firstPage()-> some View{
    var naviController: UINavigationController?
    Text("Food")
        .font(.largeTitle)
    ZStack{
        AsyncImage(url:URL(string: "https://images.pexels.com/photos/8969237/pexels-photo-8969237.jpeg")!)
        {image in
            image.resizable()
        }placeholder: {
            ProgressView()
        }
        NavigationLink("Food.com"){
            FoodTab()
        }.buttonStyle(.bordered)
            .colorMultiply(.orange)
            .buttonBorderShape(.capsule)
            .background(.green)
        GeometryReader(content: { geometry in
            HStack{
                NavigationLink("Food Table"){
                    FoodTableView()
                }.buttonStyle(.bordered)
                    .colorMultiply(.orange)
                    .buttonBorderShape(.capsule)
                    .background(.green)
                NavigationLink("Food Collection"){
                    FoodCollection()
                }.buttonStyle(.bordered)
                    .colorMultiply(.orange)
                    .buttonBorderShape(.capsule)
                    .background(.green)
                
                Button("UIKit"){
                    let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
                    let vC = storyboard.instantiateViewController(withIdentifier: "SecondStoryID")
                    print("it ran")
                    naviController = UINavigationController()
                    naviController?.pushViewController(vC, animated: true)
                    }.colorMultiply(.orange)
                    .buttonBorderShape(.capsule)
                    .background(.green)
            }
            .frame(width: 300,height:200)
            .border(.blue)
            .position(x:geometry.size.width/2 ,y:geometry.size.height/1.5)
        })
    }
}
#Preview {
    ContentView()
}
