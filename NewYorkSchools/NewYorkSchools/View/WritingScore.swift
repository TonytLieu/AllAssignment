//
//  WritingScore.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/14/23.
//

import SwiftUI

struct WritingScore: View {
    var sATWriting:String
    var body: some View {
        Text("Writing")
            .multilineTextAlignment(.center)
            .font(.largeTitle)
        Text("____________________________")
        Text("requirement")
        Text(sATWriting)
            .multilineTextAlignment(.center)
            .padding(.top)
            .background(.red)
            .font(.largeTitle)
        Spacer()
    }
}

#Preview {
    WritingScore(sATWriting: "")
}
