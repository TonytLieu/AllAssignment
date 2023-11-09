//
//  splitView.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct splitView: View {
    private var anime = ["chainsawMan","Dr.Stone","Ohana","sitch"]
    @State var selected:String?
    var body: some View {
        NavigationSplitView{//left side bar
            List(anime, id:\.self){show in
                Text(show)
            }
        }detail: {//right side view
            if let selected = selected{
               // DetailScreen()
            }
        }
    }
}

#Preview {
    splitView()
}
