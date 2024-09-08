//
//  MembersViewControllerModel.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 22.08.2024.
//

import UIKit
import Firebase
import FirebaseFirestore
class MembersViewControllerModel {
    
    //let db = Firestore.firestore()
    
    @Published var users = [User]()
    
    
    
    init() {
        //fetchAllUsers()
        fetchData()
    }
    
    func fetchData() {
        Firestore.firestore().collection("users").addSnapshotListener { (QuerySnapshot, error)  in
            guard let documents = QuerySnapshot?.documents else {
                print("no documents")
                return
            }
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let surname = data["surname"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                return User(name: name, surname: surname, email: email)
                
            }
        }
    }
    
    /*
    private func fetchAllUsers() {
        Firestore.firestore().collection("users").getDocuments { documentsSnapshot, error in
            
            if let e = error {
                print("failed to fetch all users. \(e)")
                return
            }
            
            documentsSnapshot?.documents.forEach({ snapshot in
                let data = snapshot.data()
                self.users.append(.init(data: data))
                
            })
            
            
            
            
        }
        
        
    }
     
    */
}
