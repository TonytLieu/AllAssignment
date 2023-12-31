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
    @EnvironmentObject var user:UserInfo
    var body: some View {
        VStack{
            //Text(user.userName)
            List{
                Section("1st Section"){
                    ForEach(anime, id:\.self){ show in
                        HStack{
                            Image(systemName: "doc.on.doc.fill")
                            Text(show)
                        }.onTapGesture {
                            print(show)
                        }
                    }
                }
                Section("2nd Section"){
                    ForEach(anime2, id:\.self){show in
                        NavigationLink{
                            //DetailScreen(changeTitle:)
                        }
                    label:
                        {ListCell(show: show)
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
