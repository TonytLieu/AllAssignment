//
//  ViewController.swift
//  Lol Page
//1.continuing a our existing project of login flow in iOS with storyboard add constraints to ur existing designed screens
/*2. Create a new screen for list
3 have multiple sections in it and try to design ui similar like setting screen for iPhone
4. Show use of segues on button click
5. Show use of programmatic screen navigation
6. Also pass data from one screen to another both with using segues and programmatic navigation*/
//  Created by Tony Lieu on 10/30/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emaillabel: UITextField!
    //var emailID:String = ""
    @IBOutlet weak var passwordinput: UITextField!
    //var passwordID:String = ""
    private var loginV: LoginViewModel = LoginViewModel()
    override func viewDidLoad() {
        self.title = "Login TrashCan"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            // self.title = "Login Screen"
    }//moved my login verifier to a viewModel
    @IBAction func LoginButton(_ sender: Any) {
        if loginV.loginVal(emailID: emaillabel.text, passwordinput: passwordinput.text){
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               //this makes so i can pass data to the tableViewScence
               let listVC = storyBoard.instantiateViewController(withIdentifier: "LoginpageViewController") as! LoginpageViewController
               self.navigationController?.pushViewController(listVC, animated: true)
               print("login Button tapped")
               
        }else{
            print("You are not allowed")
            let alertViewController =  UIAlertController(title: "Meassage", message: "Somthing went wrong", preferredStyle: .actionSheet)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alertViewController, animated: true)
        }
   
    }
    //how to pass data between views
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmailSegue"{
            if let LoginpageViewController = segue.destination as? LoginpageViewController{
                LoginpageViewController.emailData = emaillabel.text
                LoginpageViewController.passwordData = passwordinput.text
            }
        }
    }

}
