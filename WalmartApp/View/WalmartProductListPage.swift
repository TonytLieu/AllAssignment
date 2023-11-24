//
//  WalmartProductListPage.swift
//  WalmartApp
//
//  Created by Tony Lieu on 11/23/23.
//

import SwiftUI

struct WalmartProductListPage: View {
    var body: some View {
        NavigationStack{
            Text("Welcome To Walmart")
            List{
                NavigationLink("ProductTitle"){
                    
                }
            }
        }
    }
}

#Preview {
    WalmartProductListPage()
}
