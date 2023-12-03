//
//  MainCoordinator.swift
//  MVVMCStudy
//
//  Created by Tony Lieu on 12/3/23.
//

import Foundation
import UIKit

class MainCoordinator:Coordinator{
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ID") as! ViewController
        viewController.mainCoordinator = self
        self.navigationController.pushViewController(viewController, animated: true)
    }
    func goToSomthing(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let somthingviewController = storyboard.instantiateViewController(withIdentifier: "SomthingID")as! SomthingViewController
        somthingviewController.mainCoordinator = self
        self.navigationController.pushViewController(somthingviewController, animated: true)
    }
    func goToThird(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let somthingviewController = storyboard.instantiateViewController(withIdentifier: "ThirdID")
        self.navigationController.pushViewController(somthingviewController, animated: true)
    }
    
}
