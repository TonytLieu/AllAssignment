//
//  DetailScreen.swift
//  FirstSwiftUIApp
//
//  Created by Tony Lieu on 11/6/23.
//

import SwiftUI

struct DetailScreen: View {
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
    DetailScreen(changeTitle: .constant("sdsa"))
}
