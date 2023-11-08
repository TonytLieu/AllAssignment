//
//  viewCellCollection.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct viewCellCollection: View {
   let cellData:String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.red)
           .overlay{
            /*Image("dump")
                   .resizable()
                   .foregroundColor(.white)*/
            Text(cellData)
                   .font(.title2)
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
    }
}

#Preview {
    viewCellCollection(cellData: "CellData")
}
