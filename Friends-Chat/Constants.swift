//
//  Constant.swift
//  Friends-Chat
//
//  Created by Mehdi Oturak on 7.08.2024.
//

import Foundation


struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let signUpSegue = "signUpToChoose"
    static let signInSegue = "signInToChoose"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let recipientField = "recipient"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
