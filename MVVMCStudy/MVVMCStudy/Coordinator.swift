//
//  Coordinator.swift
//  MVVMCStudy
//
//  Created by Tony Lieu on 12/3/23.
//

import Foundation
import UIKit
protocol Coordinator: AnyObject{
    var childCoordinator:[Coordinator]{get}
    var navigationController:UINavigationController {get set}
    func startCoordinator()
}
