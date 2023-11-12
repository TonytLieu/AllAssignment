//
//  schoolCell.swift
//  NewYorkSchools
//
//  Created by Tony Lieu on 11/10/23.
//

import SwiftUI

struct schoolCell: View {
    var schoolName:String
    var body: some View {
        HStack{
            Text(schoolName)
        }
    }
}
#Preview {
    schoolCell(schoolName: "")
}
