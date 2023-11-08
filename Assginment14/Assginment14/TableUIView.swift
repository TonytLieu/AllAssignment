//
//  TableUIView.swift
//  Assginment14
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct TableUIView: View {
    var body: some View {
        NavigationStack{
            firstPage()
        }
    }
}
@ViewBuilder
func firstPage()-> some View{
    Text("Food")
        .font(.largeTitle)
    AsyncImage(url:URL(string: "https://images.pexels.com/photos/8969237/pexels-photo-8969237.jpeg")!)
    {image in
        image.resizable()
    }placeholder: {
        ProgressView()
    }
    HStack{
            NavigationLink("FoodTableView"){
                FoodTableView()
            }.buttonStyle(.bordered)
            .colorMultiply(.orange)
            .buttonBorderShape(.capsule)
            NavigationLink("FoodCollection"){
                FoodTableView()
            }.buttonStyle(.bordered)
            .colorMultiply(.orange)
            .buttonBorderShape(.capsule)
    }
}

#Preview {
    TableUIView()
}
