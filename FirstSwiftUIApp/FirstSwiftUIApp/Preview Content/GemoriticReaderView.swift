//
//  GemoriticReaderView.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/7/23.
//

import SwiftUI

struct GemoriticReaderView: View {
    var body: some View {
        Text("Parent")
            .frame(width: 200,height: 200)
            .border(.red)
        GeometryReader(content: { geometry in
            Text("A Child")
                    .frame(width: 100,height:100)
                    .border(.blue)
                    .position(x:geometry.size.width/2 ,y:geometry.size.height/10)
        })
        
    }
}

#Preview {
    GemoriticReaderView()
}
