//
//  PhoneLogin.swift
//  TestSamplePhoneLogin
//
//  Created by Tony Lieu on 12/11/23.
//

import SwiftUI
import FirebaseAuth
//this is for to Turn this to VIP
protocol PhoneLoginDisplayLogic{
    
    func SignIn()
    
    func SignUP()
    
}
struct PhoneLogin: View {
    @State var phoneNumeber:String = ""
    @State var sof = false
    @State var verification:String = ""
    @State var interactor: PhoneLoginInteractor?
    @State var present:PhoneLoginPresenter?
    //  var delegate = phoneNumberLogin()
    var body: some View {
        NavigationStack{
            Text("People")
                .font(.largeTitle)
                .padding(130)
            
            TextField("Enter Your Phone Number...", text: $phoneNumeber)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            
            TextField("Verification", text: $verification)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350, height: 25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            Spacer()
            
            NavigationLink("Sign In"){
                //this is where the scene will go to if it sucessful
                //SignInOnSucessOrFail(SoF: present?.sof ?? false)
                SignInOnSucessOrFail(SoF: sof)
            }
            .font(.system(.title, design: .none)).shadow(radius: 10)
            .frame(width: 330.0, height: 45.0)
            .background(Color(red: 1, green: 1, blue: 1))
            .clipShape(Rectangle())
            .foregroundColor(.black)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .hoverEffect()
            //this is where you can
            .onTapGesture {
//                interactor?.loadPhoneLogin(phoneNumber: phoneNumeber, VID: verification)
//                present?.present(respose: interactor!)
//                sof = present?.sof ?? false
                SignInAuth(number: phoneNumeber, verification:verification)
                }
        }.onDisappear(){
            sof = false
        }
        }
    func SignInAuth(number: String,verification: String){
            PhoneLoginWorker.shared.StartPhoneLogin(phoneNumber: number,verificationID: verification) { sof in
                self.sof = sof
            }
        sof = PhoneLoginWorker.shared.sof
        }
    }
#Preview {
    PhoneLogin()
}
