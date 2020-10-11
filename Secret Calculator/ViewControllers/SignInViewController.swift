//
//  SignInViewController.swift
//  Secret Calculator
//
//  Created by Henry Feiler on 10/7/20.
//  Copyright © 2020 Henry Feiler. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var userEmailTextFeild: UITextField!
    
    @IBOutlet weak var userPasswordTextFeild: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var logIn: UIButton!
    var email: String?
    var password: String?
    
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func SubmitButtonPressed(_ sender: UIButton) {
        
        guard ((userPasswordTextFeild?.text) != nil) && userEmailTextFeild.text != nil else {return}
        
        let email = userEmailTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = (userPasswordTextFeild.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in

            if let error = error {
                print("Error: \(error)")
            
          } else {
            print("User signs up successfully")
//            let newUserInfo = Auth.auth().currentUser
//            let email = newUserInfo?.email
          }
        }
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard ((userPasswordTextFeild?.text) != nil) && userEmailTextFeild.text != nil else {return}
        
        let email = userEmailTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = (userPasswordTextFeild.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                
                print("Error: \(error)")
            
          } else {
            print("User signs in successfully")
//            let userInfo = Auth.auth().currentUser
//            let email = userInfo?.email
          }
        }
        
        
        
        
        
    }
    
    
    
}
