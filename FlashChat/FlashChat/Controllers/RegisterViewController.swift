//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import FirebaseAuth
import FirebaseCore
import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        // Make sure email and password are not nil
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let newError = error {
                    print(newError.localizedDescription)
                } else {
                    // If no errors -> User successfully registered
                    // Go to chat
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                    
                }
            }
        }
    }
    
}
