//
//  MembersTableViewCell.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 5.09.2024.
//

import UIKit

class MembersTableViewCell: UITableViewCell {

    //MARK: -VARIABLES
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var buttonAction : (() -> ())?
    
    //MARK: -FUNCTIONS
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    @IBAction func didClicked(_ sender: UIButton) {
        
        buttonAction?()
       
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
