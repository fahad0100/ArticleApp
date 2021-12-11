//
//  AuthManger.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/8/21.
//

import Foundation
import UIKit
import Firebase


let fireStoreURL = Firestore.firestore()
func CheckAuthSignIn() -> Bool {
    if Auth.auth().currentUser?.uid == nil {
        return false
    }else{
        return true
    }
    
}








func CreatePost()->String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/mm/yy hh:mm a"
    let DateString = formatter.string(from: date)
    return DateString
}




