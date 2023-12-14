//
//  SignInOnSucess.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/12/23.
//

import SwiftUI

struct SignInOnSucessOrFail: View {
    var SoF:Bool
    var body: some View {
        if(SoF){
            Text("You SignIn Sucessfully")
        }else{
            Text("You Have not sign in")
        }
    }
}

#Preview {
    SignInOnSucessOrFail(SoF: false)
}
