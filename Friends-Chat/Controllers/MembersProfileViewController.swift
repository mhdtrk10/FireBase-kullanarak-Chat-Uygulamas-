//
//  MembersProfileVİewController.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 8.08.2024.
//

import UIKit
import AVFoundation
import Firebase
class MembersProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surNameLabel: UILabel!
    

    @IBOutlet weak var userNameLabel: UILabel!
    
    var namelabeltext = ""
    var surNameLabeltext = ""
    var userNameLabeltext = ""
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
       
        
        nameLabel.text = namelabeltext
        surNameLabel.text = surNameLabeltext
        userNameLabel.text = userNameLabeltext
        
        
        
    }
    
   
    
    @IBAction func SongPressed(_ sender: UIButton) {
        
        if Auth.auth().currentUser?.email == "mehdi@gmail.com" {
            let url = Bundle.main.url(forResource: "Cistak", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
        else if Auth.auth().currentUser?.email == "numan@gmail.com" {
            let url = Bundle.main.url(forResource: "gökyüzünütutamam", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
        else if Auth.auth().currentUser?.email == "apocan@gmail.com" {
            let url = Bundle.main.url(forResource: "kadehkirildi", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
        
                                    
    }
}

