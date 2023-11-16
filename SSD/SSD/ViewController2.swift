//
//  ViewController2.swift
//  SSD
//
//  Created by Tony Lieu on 11/15/23.
//

import UIKit
struct Setting:Decodable{
    let dark:String
    let light:String
}
class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "Setting", withExtension: "plist"){
            do{
                let data = try! Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                let setting = try
                            decoder.decode([Setting].self, from: data)
            }catch{
                print(error)
            }
            
        }
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
