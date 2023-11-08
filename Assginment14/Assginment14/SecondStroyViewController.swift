//
//  SecondStroyViewController.swift
//  Assginment14
//
//  Created by Tony Lieu on 11/7/23.
//

import UIKit
import SwiftUI

class SecondStroyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoingBack(_ sender: Any) {
        let vC = UIHostingController(rootView: ContentView())
        self.navigationController?.pushViewController(vC, animated: true)
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
