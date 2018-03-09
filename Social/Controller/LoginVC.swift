//
//  ViewController.swift
//  Social
//
//  Created by Tomas Giraldo on 1/26/18.
//  Copyright © 2018 Tomas Giraldo. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase


class LoginVC: UIViewController, FBSDKLoginButtonDelegate {

 
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email"]
  
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //MARK: - Firebase auth method with email
    
    @IBAction func signInUpButton(_ sender: Any) {
    
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error!)
                Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    if error != nil {
                        print(error!)
                
                    }
                    else {
                        print ("signed in")
                    }
                })
            }
            else{
                print ("Registered with email")
            }
        }

        
        
    }
    

        
    
   

            //MARK: - Firebase auth method with Facebook
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error?) {
        if error == nil {
            let _ : FBSDKLoginManagerLoginResult = result
            if result.isCancelled {
                return
            }
            
        }
        if let error = error {
            
            print(error.localizedDescription)
            
            return
            
        }
        
        print ("Suceess")
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            
            if let error = error {
                
                print (error)
                
            }
            else {
                
                print("registration success")
                
//                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
    }

    
    
}


