//
//  ViewController.swift
//  FireBaseUIKit
//
//  Created by Tony Lieu on 12/4/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseEmailAuthUI
import FirebasePhoneAuthUI
import FirebaseFacebookAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI

class ViewController: UIViewController, FUIAuthDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SignIn(_ sender: Any) {
        var actionCodeSettings = ActionCodeSettings()
                actionCodeSettings.url = URL(string: "fir-testing-42e6b.firebaseapp.com")
                actionCodeSettings.handleCodeInApp = true
                actionCodeSettings.setAndroidPackageName("com.firebase.example", installIfNotAvailable: false, minimumVersion: "12")

                let provider = FUIEmailAuth(authAuthUI: FUIAuth.defaultAuthUI()!,
                                            signInMethod: GoogleAuthSignInMethod,
                                            forceSameDevice: false,
                                            allowNewEmailAccounts: true,
                                            actionCodeSetting: actionCodeSettings)
                let authUI = FUIAuth.defaultAuthUI()
                // You need to adopt a FUIAuthDelegate protocol to receive callback
                authUI?.delegate = self
                authUI?.providers = [provider]
        if let authViewController = authUI?.authViewController(){
            self.present(authViewController, animated: true)
        }
    }
    @IBAction func SignInReal(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let googleAuthProvider = FUIGoogleAuth(authUI: authUI!)
            let authProviders: [FUIAuthProvider] = [
                googleAuthProvider
            ]
        authUI?.providers = authProviders
        if let authViewController = authUI?.authViewController(){
            self.present(authViewController, animated: true)
        }
    }
    func authUI(_ authUI: FUIAuth, didSignInWith user:User?, error: Error?) {
        if error == nil{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "vc2") as! ViewController2
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

