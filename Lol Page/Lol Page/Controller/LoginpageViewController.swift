//
//  LoginpageViewController.swift
//  Lol Page
//
//  Created by Tony Lieu on 10/31/23.
//

import UIKit

class LoginpageViewController: UIViewController {
    var emailData:String?
    @IBOutlet weak var emailName: UILabel!
    var passwordData:String?
    @IBOutlet weak var Nameplate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setValueLabel()
        // Do any additional setup after loading the view.
    }
    func setValueLabel(){
        Nameplate.text = emailData
    }//this one will take you to the grid View Scence
    @IBAction func gridButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //this makes so i can pass data to the tableViewScence
        let listGC = storyBoard.instantiateViewController(withIdentifier: "GridViewController") as! GridViewController
        self.navigationController?.pushViewController(listGC, animated: true)
    }
    @IBAction func buttonlist(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //this makes so i can pass data to the tableViewScence
        let listVC = storyBoard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        listVC.emailAddress = emailName.text ?? ""
        self.navigationController?.pushViewController(listVC, animated: true)
    }
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
       // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        //}
        
    
}
