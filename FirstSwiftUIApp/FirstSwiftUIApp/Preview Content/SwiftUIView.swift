//
//  SwiftUIView.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack{
            Image("dump")
                .colorInvert()
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                    .foregroundStyle(.orange)
                Button("button"){
                    
                }
            }
           
        }
    }
}

#Preview {
    SwiftUIView()
}
