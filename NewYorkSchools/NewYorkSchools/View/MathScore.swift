//
//  CREScore.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/14/23.
//

import SwiftUI

struct MathScore: View {
    var sATMath:String
    var body: some View {
        Text("Math")
            .multilineTextAlignment(.center)
            .font(.largeTitle)
        Text("____________________________")
        Text("requirement")
        Text(sATMath)
            .multilineTextAlignment(.center)
            .padding(.top)
            .background(.red)
            .font(.largeTitle)
        Spacer()
    }
}

#Preview {
    MathScore(sATMath: "")
}
