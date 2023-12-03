//
//  LoginPage.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//

import SwiftUI

struct LoginPage: View {
    @State var userName:String = ""
    @State var password:String = ""
    @EnvironmentObject var coordinator:Coordinate
    var loginVa = LoginViewModel()
    var body: some View {
        NavigationStack(path: $coordinator.path){
            VStack{
                Image("DNDLogo")
                    .shadow(color:.black, radius: 10,x: 10, y: -10)
                Image("Monster")
                    .resizable()
                    .frame(width: 300, height: 130)
                    .shadow(color:.black, radius: 5,x: 10, y: -10)
                    .position(x:225)
                TextField("User Name ", text: $userName)
                    .position(x:180, y:40)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 350, height: 150)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                HStack{
                    Text("________ _")
                    Text("________________")
                    Text("_ _______")
                }
                .padding(.top, 20)
                SecureField("Password", text: $password)
                    .position(x:180, y:-100)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 350, height: 50)
                    .padding()
                Button("Start"){
                    //this is to valdaite the email and password
//                    if loginVa.loginVal(emailID: userName, passwordinput: password){
//                            UserPage(userName: userName, password: password)
//                    }
                    coordinator.goMonsterListScreen()
                }
                .font(.system(.title, design: .rounded)).shadow(radius: 10)
                .frame(width: 200.0, height: 50.0)
                .background(Color(red: 0.8, green: 0, blue: 0))
                .clipShape(Capsule())
                .foregroundColor(.black)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .hoverEffect()
                .padding(.bottom, 100)
                HStack(){
                    Text("Don't have an Account?")
                    NavigationLink(" Sign Up Now"){
                    }
                }
                HStack(){
                    Text("Forget password?")
                    NavigationLink("Click Here"){
                        
                    }
                }
            }
            
        }
        
    }
}
#Preview {
    LoginPage().environmentObject(Coordinate())
}
