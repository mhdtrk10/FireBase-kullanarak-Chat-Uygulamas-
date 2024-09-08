//
//  SignUpViewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 8.08.2024.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    let db = Firestore.firestore()
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text,
           let surname = surnameTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult , error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.signUpSegue, sender: self)
                }
                
                self.db.collection("users").addDocument(data: [
                    "name": name ,
                    "surname": surname ,
                    "email": email ,
                    "password": password
                    
                ]) { (error) in
                    
                    if let e = error {
                        print("There was an issue saving data to firestore, \(e)")
                    } else {
                        print("Succesfully saved data.")
                    }
                    
                    
                }
            }
        }
    }
}



