//
//  User Firebase File.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/11/21.
//

import Foundation
import Firebase



func ChangeUserName(newName:String){
    DispatchQueue.global(qos: .userInteractive).async {
        DispatchQueue.main.async {
            let userID = Auth.auth().currentUser?.uid
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = newName
            changeRequest?.commitChanges { (error) in
      
                if error == nil {
                    fireStoreURL.collection("Users").document(userID!).updateData(["UserName":newName])

                }
                
            }
        }
    }
    
}
func ChangeUserEmail(newEmail:String){
    let user = Auth.auth().currentUser
    user?.updateEmail(to: newEmail, completion: { error in
        if error == nil {
            
        }
    })
}
