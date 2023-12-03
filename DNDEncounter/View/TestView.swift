//
//  TestView.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 12/3/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var coordinator:Coordinate
    var body: some View {
        NavigationStack(path: $coordinator.path){
            coordinator.getPage(page: .LoginPage)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page: page)
                }
        }
        
    }
}

#Preview {
    TestView().environmentObject(Coordinate())
}
