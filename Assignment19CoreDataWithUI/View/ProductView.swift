//
//  ProductView.swift
//  Assignment19CoreDataWithUI
//
//  Created by Tony Lieu on 11/21/23.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("KeyChain Screen"){
               EmptyView()
            }.padding()
            NavigationLink("CoreData Screen"){
                ProductViewList()
            }
        }
    }
}

#Preview {
    ProductView()
}
