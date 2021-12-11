//
//  SignUpPage.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/8/21.
//

import UIKit
import Firebase
class SignUpPage: UIViewController {
    
    
    @IBOutlet weak var ImageLogo: UIImageView!
    
    @IBOutlet weak var NameEnter: UITextField!
    @IBOutlet weak var EmailEnter: UITextField!
    @IBOutlet weak var PasswordEnter: UITextField!
    
    @IBOutlet weak var Loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Loading.isHidden = true
        NameEnter.currectBorder()
        EmailEnter.currectBorder()
        PasswordEnter.currectBorder()
   
        
    }
    
    

    @IBAction func SignUpAction(_ sender: Any)   {

        NameEnter.currectBorder()
        EmailEnter.currectBorder()
        PasswordEnter.currectBorder()
        guard NameEnter.text != "" || NameEnter.text?.isEmpty != true else {
            NameEnter.errorBorder()
            
            return  self.present(Alert(Title: "Error", Message: "Enter Your Name", ButtonTitle: "Currect"), animated: true, completion: nil)
        }
        guard EmailEnter.text != "" || EmailEnter.text?.isEmpty != true else {
            EmailEnter.errorBorder()
            return  self.present(Alert(Title: "Error", Message: "Enter Your Email", ButtonTitle: "Currect"), animated: true, completion: nil)
        }
        guard PasswordEnter.text != "" || PasswordEnter.text?.isEmpty != true else {
            PasswordEnter.errorBorder()
            return  self.present(Alert(Title: "Error", Message: "Enter Your Password", ButtonTitle: "Currect"), animated: true, completion: nil)
        }
        
        Loading.isHidden = false
        Loading.startAnimating()
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.main.async {
                Auth.auth().createUser(withEmail: self.EmailEnter.text!, password: self.PasswordEnter.text!) { user, error in
                    if error == nil {
                   
                        self.Loading.isHidden = true
                    
                        let infoUser = ["UserName":self.NameEnter.text,"Email":user?.user.email,"Password":self.PasswordEnter.text!] as [String : Any]
                        fireStoreURL.collection("Users").document(user!.user.uid).setData(infoUser )
                        ChangeUserName(newName: self.NameEnter.text!)
                        sleep(5)
                        self.Loading.stopAnimating()
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CheckAuthPage") as! CheckAuthPage
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                        
                    }else{
                        self.Loading.stopAnimating()
                        self.Loading.isHidden = true
                        self.present(Alert(Title: "Error", Message: error!.localizedDescription, ButtonTitle: "Currect"), animated: true, completion: nil)
                  
                    }
                }
               
            
        }
    }
    }
}


extension UITextField {
    func errorBorder(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    func currectBorder(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }

}

