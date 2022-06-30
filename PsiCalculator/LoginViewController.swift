//
//  LoginViewController.swift
//  PsiCalculator
//
//  Created by Hector Carmona on 5/24/22.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseCore
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var rodLabel: UILabel!
    @IBOutlet weak var engineeringLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var rodLogoImage: UIImageView!
    @IBOutlet weak var loginErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        emailTextfield.placeholder = "email"
        passwordTextfield.placeholder = "password"
        self.loginErrorLabel.text = ""
        
        IQKeyboardManager.shared.enable = false
        let rodriguezText = "PSI\nCALCULATOR 🏗"
        rodLabel.text = ""
        var indexNum = 0.0

        for letter in rodriguezText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * indexNum, repeats: false) { timer in
                self.rodLabel.text?.append(letter)
            }
            indexNum += 1
        }
        emailTextfield.text = "rod.pharr@relcme.com"
        passwordTextfield.text = "Cylinders2020!"
    
    }
    

    
    //MARK: - Login pressed

     
     @IBAction func loginButtonPressed(_ sender: UIButton) {
         
         if let email = emailTextfield.text, let password = passwordTextfield.text {
             Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                             if let e = error {
                                 print(e)
                                 self.loginErrorLabel.text = "Email and/or Password incorrect"
                                 
                             } else {
                                 print("!!!!!!!!!!!!!!!!!")
                                 self.loginErrorLabel.text = ""
                                 self.performSegue(withIdentifier: "goToCylinders", sender: self)
                                 
                             }
                         }
             
         }
     }
//    @IBAction func loginPressed(_ sender: UIButton) {
//
//        if let email = emailTextfield.text, let password = passwordTextfield.text {
//
//            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                if let e = error {
//                    print(e)
//                } else {
//                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
//                }
//            }
//
//        }
//
//    }
     
}

//MARK: - UITextField Delegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
    }
    
}
