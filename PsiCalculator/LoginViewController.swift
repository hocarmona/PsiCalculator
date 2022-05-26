//
//  LoginViewController.swift
//  PsiCalculator
//
//  Created by Hector Carmona on 5/24/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var rodLabel: UILabel!
    @IBOutlet weak var engineeringLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rodriguezText = "PSI\nCALCULATOR 🏗"
        rodLabel.text = ""
        var indexNum = 0.0

        for letter in rodriguezText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * indexNum, repeats: false) { timer in
                self.rodLabel.text?.append(letter)
            }
            indexNum += 1
        }
    
    }
    

    
    //MARK: - Login pressed

     
     @IBAction func loginButtonPressed(_ sender: UIButton) {
         
         print(emailTextfield.text!)
         print(passwordTextfield.text!)
     }
     

    

}
