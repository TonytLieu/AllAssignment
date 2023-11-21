//
//  ContentView.swift
//  TempBankSystem
//
//  Created by Tony Lieu on 11/17/23.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        @State var bankAccountNumber:String = ""
        @State var bankPassword:String = ""
        //this bool is to make sure the account is verified
        // var AccountActice:Bool = false
        NavigationStack{
            VStack {
                Image("BankLogo")
                    .resizable()
                    .frame(width: 400, height: 250)
                TextField("Account Number ", text: $bankAccountNumber)
                    .textFieldStyle(.roundedBorder)
                      SecureField("Password", text: $bankPassword)
                          .textFieldStyle(.roundedBorder)
                      NavigationLink("Login"){
                          CustomerAccount()
                      }
                      .frame(width: 100.0, height: 50.0)
                      .buttonBorderShape(.capsule).background(.orange)
                    .foregroundColor(.black)
                      Spacer()
                  }
                  .padding()
        }
      
    }
}

#Preview {
    LoginPage()
}
