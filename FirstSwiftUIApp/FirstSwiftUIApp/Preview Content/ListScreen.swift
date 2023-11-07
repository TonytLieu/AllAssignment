//
//  ListScreen.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct ListScreen: View {
    private var anime = ["chainsawMan","Dr.Stone", "Ohana"]
    private var anime2 = ["naruto", "Sams", "Bleach"]
    var body: some View {
        VStack{
            Section("1st Section"){
                List(anime, id:\.self){ show in
                    HStack{
                        Image(systemName: "doc.on.doc.fill")
                        Text(show)
                    }.onTapGesture {
                        print(show)
                    }
                }
            }
            Section("2nd Section"){
                List{
                    ForEach(anime2, id:\.self){show in
                        NavigationLink{
                           DetailScreen()
                        }label:{ListCell(show: show)
                        }
                        }
                      
                    }
                }
            }
        }
    }
#Preview {
    ListScreen()
}
