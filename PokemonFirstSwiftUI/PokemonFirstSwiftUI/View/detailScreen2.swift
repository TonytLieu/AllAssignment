//
//  detailScreen2.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct detailScreen2: View {
        @Binding var changeTitle:String
        
        @AppStorage("userNickName") var nickName = "uiKit"//userdefault
        var body: some View {
            Text(changeTitle)
            Button("Change Ttile for previous screen"){
                changeTitle = "Title from second screen"
                nickName = "Harry"
            }
            Text(nickName)
        }
    }

    #Preview {
        detailScreen2(changeTitle: .constant("sdsa"))
    }

