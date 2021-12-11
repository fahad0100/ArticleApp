//
//  ProfilePage.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/10/21.
//

import UIKit
import Firebase
class ProfilePage: UIViewController {

    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameUser: UITextField!
    
    @IBOutlet weak var EmailUser: UITextField!


    let user = Auth.auth().currentUser
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        nameUser.text = user?.displayName
        EmailUser.text = user?.email

    }
    

    @IBAction func SaveAction(_ sender: Any) {
        if nameUser.text != user?.displayName {
            ChangeUserName(newName: nameUser.text!)
            print(" i change it user name")

            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func SignOutAction(_ sender: Any) {
                do {
        
                     try Auth.auth().signOut()
                    deleteAllDate(context: self.context)
                    dismiss(animated: true, completion: nil)
                 }catch {
                     print(error.localizedDescription)
                 }
        
    }
    
}





//if let user = user {
//    let changeRequest = user.createProfileChangeRequest()
//
//   changeRequest.displayName = "Jane Q. User"
////              changeRequest.photoURL =
////                  NSURL(string: "https://example.com/jane-q-user/profile.jpg")
//    changeRequest.commitChanges { error in
//     if error == nil {
//
//         changeRequest.displayName = self.nameUser.text
//
//     } else {
//       // Profile updated.
//     }
//   }
// }
