//
//  TabBarViews.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct TabBarViews: View {
    var body: some View {
        TabView{
            ListScreen()
                .tabItem {  Image(systemName: "square.and.arrow.up")
                    Text("1st tab") }
            Collection()
                .tabItem {  Image(systemName: "square.and.arrow.up")
                    Text("2st tab") }
        }
        
    }
}

#Preview {
    TabBarViews()
}
