//
//  PlaceAnnotationView.swift
//  Maps
//
//  Created by Tony Lieu on 11/27/23.
//

import SwiftUI
import MapKit
struct PlaceAnnotationView: View {
    let title:String
    @State var showTitle = true
    var body: some View {
        VStack{
            Text(title)
                .font(.callout)
                .padding(1)
                .opacity(showTitle ? 0 :1)
            Image(systemName: "mappin")
                .font(.title)
                .foregroundColor(.red)
        }.onTapGesture {
            withAnimation(.easeInOut){
                showTitle.toggle()
            }
        }
    }
}

#Preview {
    PlaceAnnotationView(title: "title")
}
