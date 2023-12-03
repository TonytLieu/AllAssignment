//
//  SomthingViewController.swift
//  MVVMCStudy
//
//  Created by Tony Lieu on 12/3/23.
//

import UIKit

class SomthingViewController: UIViewController {
    weak var mainCoordinator:MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ThirdButton(_ sender: Any) {
        mainCoordinator?.goToThird()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
