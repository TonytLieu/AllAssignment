//
//  Collection.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct Collection: View {
    private var anime = ["chainsawMan","Dr.Stone", "Ohana"]
    private var anime2 = ["naruto", "Sams", "Bleach"]
    private var foodColums = [GridItem(),GridItem(),GridItem()]
    var body: some View {
        // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            ScrollView(){
                LazyVGrid(columns: foodColums){
                   // HStack{
                        ForEach(anime, id:\.self){show in
                            NavigationLink{
                                DetailScreen()
                            }
                        label:{viewCellCollection(cellData: show)
                             //   .frame(width: 100, height: 100)
                        }
                        }
                    //}
                    //.padding()
                }
               // .padding(10)
                ScrollView(.horizontal){
                    LazyHGrid(rows: foodColums){
                       // HStack{
                            ForEach(anime2, id:\.self){show in
                                NavigationLink{
                                    ImageDisplay()
                                }label:{viewCellCollection(cellData: show)
                                       // .frame(width: 200, height: 200)
                                }//.navigationTitle("Navigation")
                            }
                       // }
                    }
                }
            }
        }.padding(10)
    }
    }
#Preview {
    Collection()
}
