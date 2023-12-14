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
import FirebaseAnalytics
import FirebaseDatabase
import FirebaseStorage

class ViewController: UIViewController, FUIAuthDelegate {
    var ref:DatabaseReference!
    private var urlStorage =  "gs://fir-testing-42e6b.appspot.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupAndListentoFB()
    }
    func setupAndListentoFB(){
        ref = Database.database().reference()
        ref.child("Root").observe(.childAdded, with:{snapshot in print(snapshot)})
    }
    @IBAction func SignIn(_ sender: Any) {
        Analytics.logEvent( AnalyticsEventSignUp, parameters: [
        "Event" : "Singin"
        ])
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
        Analytics.logEvent( AnalyticsEventLogin, parameters: [
        "Event" : "Singin"
        ])
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let googleAuthProvider = FUIGoogleAuth(authUI: authUI!)
            let authProviders: [FUIAuthProvider] = [
                googleAuthProvider
               // FUIFacebookAuth()
                
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
    
    @IBAction func Save(_ sender: Any) {
        //create the Rood child and will create another one if push twice
        //self.ref.child("Root").childByAutoId().setValue(["data": "testData"])
        //this one is to update the same child
       //self.ref.child("Root").child("-NlOJ8IGozpL4no8n67x").setValue(["data": "Updated"])
        //this one will make it nill
        self.ref.child("Root").child("-NlOJ8IGozpL4no8n67x").setValue("tony")
    }
    @IBAction func Storage(_ sender: Any) {
        // default Firebase App gs://fir-testing-42e6b.appspot.com

    }
}

