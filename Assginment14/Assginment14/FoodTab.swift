//
//  FoodTab.swift
//  Assginment14
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct FoodTab: View {
    var body: some View {
        TabView{
            FoodWeb()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FoodTableView()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Food Table") }
            FoodCollection()
                .tabItem {  Image(systemName: "takeoutbag.and.cup.and.straw")
                    Text("Food Collation") }
        }
    }
}


#Preview {
    FoodTab()
}
