//
//  NoNumberFound.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/12/23.
//

import SwiftUI

struct NoNumberFound: View {
    var body: some View {
        Text("No Number found")
            .font(.largeTitle)
        NavigationLink("Return"){
            PhoneLogin()
        }
        .font(.system(.title, design: .none)).shadow(radius: 10)
        .frame(width: 100.0, height: 30.0)
        .background(Color(red: 1, green: 1, blue: 1))
        .clipShape(Rectangle())
        .foregroundColor(.black)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .hoverEffect()
    }
}

#Preview {
    NoNumberFound()
}
