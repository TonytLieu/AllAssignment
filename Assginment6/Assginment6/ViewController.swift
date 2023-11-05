//
//  ViewController.swift
//  Assginment6
//
//  Created by Tony Lieu on 10/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var t1 = Theater(theaterName: "BigMovie", address: "1234 hello street", masterPassword: 1234)
        print(t1.theaterName)
        do{
            var mp = AuthorizedMovie()
            mp.avaibleMovie(isAvaiable: true)
            try t1.checkPassword(pass: 1234, mA: mp)
        }catch let error{
            print("error: \(error.localizedDescription)")
        }
        let Seat1 = Seat(seatNumber: 1, avaible: true)
        Seat1.mA = AuthorizedMovie()
    }
}
