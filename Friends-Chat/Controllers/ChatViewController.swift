//
//  ChatViewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 8.09.2024.
//

import Firebase
import UIKit


class ChatViewController: UIViewController {
    
    
    
   
   
    

    @IBOutlet var nameButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var meesageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var buttonName = ""
    
    var holdemail = ""
    
    var vm = MembersViewControllerModel()
    
    var messages: [Message] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameButton.setTitle(buttonName, for: .normal)
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
        aliciemail()
        
    }
    
    func aliciemail() {
        vm.users.forEach { User in
            if User.name == buttonName {
                holdemail = User.email
            }
        }
    }
    
    
    func loadMessages() {
        
       // var messageSender = ""
       // var recipientemail = ""
       // var messageBody = ""
       // var newMessage = ""
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (QuerySnapshot, error) in
                self.messages = []
                
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                }
                else {
                    if let snapshotDocuments = QuerySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String,
                               let recipientemail = data[K.FStore.recipientField] as? String,
                               let messageBody = data[K.FStore.bodyField] as? String {
                                
                                let newMessage = Message(sender: messageSender,recipient: recipientemail ,body: messageBody)
                                
                                if self.holdemail == "\(recipientemail)" && Auth.auth().currentUser?.email == "\(messageSender)" || self.holdemail == "\(messageSender)" && Auth.auth().currentUser?.email == "\(recipientemail)" {
                                    self.messages.append(newMessage)
                                }
                                //self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    //let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    //self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                                
                                
                            }
                               
                        }
                    }
                }
                
            }
        
    }
    
    
    @IBAction func nameButtonProfile(_ sender: UIButton) {
        
    }
    
    
    @IBAction func sendPressed(_ sender: Any) {
        
        
        
        
        
        if let messageBody = meesageTextField.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.recipientField: holdemail,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
                
            ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    print("Succesfully saved data.")
                    self.meesageTextField.text = ""
                    
                    //DispatchQueue.main.sync {
                        //self.meesageTextField.text = ""
                    //}
                }
            }
        }
        
    }
}

extension ChatViewController: UITableViewDelegate {
    
}
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple )
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell
    }
     
}

