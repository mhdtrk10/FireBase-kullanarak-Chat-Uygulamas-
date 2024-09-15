//
//  MembersViewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 8.08.2024.
//

import UIKit
import Firebase




class MembersViewController: UIViewController {

    
    var names = Array<String>()
    
    var vm = MembersViewControllerModel()
    
    
    
    @IBOutlet weak var tableVİew: UITableView!
    

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVİew.dataSource = self
        tableVİew.delegate = self
        
        
        vm.users.forEach { User in
            if Auth.auth().currentUser?.email != User.email {
                names.append(User.name)
            }
        }
        
    }
     
    
    
}

extension MembersViewController: UITableViewDelegate {
    
}

extension MembersViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MembersTableViewCell
        
        let vC = self.storyboard?.instantiateViewController(identifier: "ChatInfo") as! ChatViewController

        cell.nameLabel.text = names[indexPath.row]
       
        
        
        cell.buttonAction = { [unowned self] in
            let selectedIndexPath = indexPath.row
            
            
            
            vC.buttonName = names[selectedIndexPath]
            
            self.navigationController?.pushViewController(vC, animated: true)
                }
        
        
        return cell
    }
    
}

    
