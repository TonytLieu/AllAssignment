//
//  NumberVerify.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/12/23.
//

import SwiftUI

import FirebaseAuth

struct NumberVerify: View {
    
    @State var sMS:String = ""
    
    var body: some View {
        VStack{
            TextField("SMS Code", text: $sMS)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200, height: 40)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            
            NavigationLink("Verify"){
                //if verified will take to user screen
                //                      AuthManager.shared.verifiyCode(smsCode: sMS, completion: { sof in
                //                          if(sof){
                //                              SignInOnSucessOrFail(SoF: sof)
                //                          }else{
                //                              SignInOnSucessOrFail(SoF: sof)
                //                          }
                //                      })
            }
            .font(.system(.title, design: .none)).shadow(radius: 10)
            .frame(width: 100.0, height: 30.0)
            .background(Color(red: 1, green: 1, blue: 1))
            .clipShape(Rectangle())
            .foregroundColor(.black)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .hoverEffect()
        }
    }
    
}

#Preview {
    NumberVerify()
}
