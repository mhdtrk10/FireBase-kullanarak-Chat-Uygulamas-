//
//  ChoosePageViewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 8.08.2024.
//

import UIKit
import Firebase


class ChoosePageViewController: UIViewController {
    
    
    
    var vm = MembersViewControllerModel()
    
    @IBAction func ProfilePressed(_ sender: UIButton) {
        
        
        
        let vC = self.storyboard?.instantiateViewController(identifier: "MembersToInfo") as! MembersProfileViewController
        
       
        
        if let username = Auth.auth().currentUser?.email {
            
           
            
            
            vC.userNameLabeltext = username
            
            vm.users.forEach { User in
                
                if User.email == username {
                    vC.namelabeltext = User.name
                    vC.surNameLabeltext = User.surname
                }
            }
            //print(vm.users.count)
            
            
        }
        
        
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
}

