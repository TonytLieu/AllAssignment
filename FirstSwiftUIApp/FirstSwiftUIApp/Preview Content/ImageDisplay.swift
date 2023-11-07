//
//  ImageDisplay.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct ImageDisplay: View {
    var body: some View {
        Text("hello")
        VStack{
            Image(systemName: "square.and.arrow.up.circle.fill")
                .resizable()
                .frame(width: 100 , height: 100)
                .foregroundColor(.gray)
                //AsyncImage(url:URL(string: "https://picsum.photos/od/237/200/300")!)
            AsyncImage(url: URL(string: "https://picsum.photos/od/237/200/300")!)
            {image in
            }placeholder: {
                ProgressView()
            }
            }
        }
    }
#Preview {
    ImageDisplay()
}
