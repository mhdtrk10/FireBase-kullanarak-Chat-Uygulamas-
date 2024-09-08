//
//  ChatViewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 8.09.2024.
//

import Firebase
import UIKit


class ChatViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var meesageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //tableView.dataSource = self
        //tableView.delegate = self
        //loadMessages()
       
    }
    /*
    func loadMessages() {
        
        
    }
    */
    
    @IBAction func sendPressed(_ sender: Any) {
        
        if let messageBody = meesageTextField.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
                
            ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    print("Succesfully saved data.")
                    DispatchQueue.main.sync {
                        self.meesageTextField.text = ""
                    }
                }
            }
            
        }
        
        
        
    }
}
/*
extension ChatViewController: UITableViewDelegate {
    
}
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
     
}
*/
