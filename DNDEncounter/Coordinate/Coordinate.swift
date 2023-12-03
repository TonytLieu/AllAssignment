//
//  Coordinate.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/29/23.
//

import Foundation
import SwiftUI
@MainActor
class Coordinate:ObservableObject{
    @Published var path = NavigationPath()
    @Published var page:MyPage = .LoginPage
    func startCoordinator(){
    
    }
    func goLoginScreen(){
        
    }
    func goSignUpScreen(){
        
    }
    func goMonsterListScreen(){
        path.append(MyPage.MonsterListName)
    }
    func goMonsterPicListScreen(){
        path.append(MyPage.MonsterListpic)
    }
    func goMonsterDetailView(){
        
    }
    func goUserPageScreen(){
        
    }
    func goEncounterScreen(){
        
    }
    func goEncounterManagerScreen(){
        
    }
    @ViewBuilder
    func getPage(page:MyPage) -> some View{
        switch page{
        case .LoginPage:
            LoginPage()
        case .MonsterListName:
            MonsterListName()
        case .MonsterListpic:
            MonsterListPic()
        default:
            LoginPage()
        }
        
    }

}
enum MyPage:String{
    case LoginPage
    case MonsterListName
    case MonsterListpic
    var id : String {self.rawValue}
}
