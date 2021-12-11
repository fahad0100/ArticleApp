//
//  SignInPage.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/8/21.
//

import UIKit
import Firebase
class SignInPage: UIViewController {

    @IBOutlet weak var EmailEnter: UITextField!
    @IBOutlet weak var PasswordEnter: UITextField!

   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SignInAction(_ sender: Any) {
        
        guard EmailEnter.text != "" || EmailEnter.text?.isEmpty != true else {
            EmailEnter.errorBorder()
            return  self.present(Alert(Title: "Error", Message: "Enter Your Email", ButtonTitle: "Currect"), animated: true, completion: nil)
        }
        guard PasswordEnter.text != "" || PasswordEnter.text?.isEmpty != true else {
            PasswordEnter.errorBorder()
            return  self.present(Alert(Title: "Error", Message: "Enter Your Password", ButtonTitle: "Currect"), animated: true, completion: nil)
        }
        
        Auth.auth().signIn(withEmail: EmailEnter.text!, password: PasswordEnter.text!) { user, error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }else{
                self.present(Alert(Title: "Error", Message: error!.localizedDescription, ButtonTitle: "Currect"), animated: true, completion: nil)
            }
        }
    }
    


}
