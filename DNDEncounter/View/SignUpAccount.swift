//
//  SignUpAccount.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//

import SwiftUI

struct SignUpAccount: View {
   @State var userName:String = ""
   @State var password:String = ""
   @State var email:String = ""
    var body: some View {
        Text("Create Account")
        VStack{
            TextField("User Name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            TextField("Retype Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
        }
        Spacer()
    }
}

#Preview {
    SignUpAccount()
}
