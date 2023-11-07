//
//  ListCell.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct ListCell: View {
    var show:String
    var body: some View {
        HStack{
            Image(systemName: "doc.on.doc.fill")
            Text(show)
                .colorInvert()
        }.onTapGesture {
            print(show)
        }
    }
}

#Preview {
    ListCell(show: "")
}
