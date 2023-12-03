//
//  ViewController.swift
//  MVVMCStudy
//
//  Created by Tony Lieu on 11/30/23.
//
/*
 MVVM-C
 */
import UIKit

class ViewController: UIViewController {
    weak var mainCoordinator:MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Somethingbutton(_ sender: Any) {
        mainCoordinator?.goToSomthing()
    }
    

}

