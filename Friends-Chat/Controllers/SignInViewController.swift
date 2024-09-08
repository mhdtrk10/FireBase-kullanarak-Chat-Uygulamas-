//
//  ViewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 5.08.2024.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = mailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult , error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.signInSegue, sender: self)
                }
                
                
            }
            
            
        }
    }
}

