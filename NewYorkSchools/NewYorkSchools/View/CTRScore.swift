//
//  CTRScore.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/14/23.
//

import SwiftUI

struct CTRScore: View {
    var sATCTR:String
    var body: some View {
        Text("Critical Thinking And Reading")
            .multilineTextAlignment(.center)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Text("____________________________")
        Text("requirement")
        Text(sATCTR)
            .multilineTextAlignment(.center)
            .padding(.top)
            .background(.red)
            .font(.largeTitle)
        Spacer()
    }
}

#Preview {
    CTRScore(sATCTR: "")
}
