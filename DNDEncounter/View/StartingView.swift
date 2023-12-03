//
//  StartingVie.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/29/23.
//

import SwiftUI

struct StartingView: View {
    @EnvironmentObject var coordinate:Coordinate
    var body: some View {
        NavigationStack(path: $coordinate.path){
            LoginPage()
        }
    }
}

#Preview {
    StartingView()
}
