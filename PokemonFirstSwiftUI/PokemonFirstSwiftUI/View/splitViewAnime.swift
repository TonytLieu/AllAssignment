//
//  splitViewAnime.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct splitViewAnime: View {
        private var anime = ["chainsawMan","Dr.Stone","Ohana","sitch"]
        var body: some View {
            NavigationSplitView{//left side bar
                List(anime, id:\.self){show in
                    Text(show)
                }
            }detail: {//right side view
                
            }
        }
    }


#Preview {
    splitViewAnime()
}
