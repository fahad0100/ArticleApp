//
//  ViewController.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/8/21.
//

import UIKit
import Firebase
import CoreData
class CheckAuthPage: UIViewController {
    
    let FirStore = Firestore.firestore()
    let IDAuth = Auth.auth().currentUser
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        if CheckAuthSignIn() == true {
            FirStore.collection("Contents").document(IDAuth!.uid).collection("Article").addSnapshotListener { SnapShotData, error in
                if error == nil {
                    DispatchQueue.global(qos: .userInteractive).async {
                        DispatchQueue.main.async {
                            deleteAllDate(context: self.context)
                        }
                    }
                    guard let dateGet = SnapShotData else {return}
                    for test in dateGet.documents {

                        let GetPost =   ContentPost(idPost: test.documentID ,
                                                    title: test.get("Title") as! String,
                                                    content: test.get("Content") as! String,
                                                    created: test.get("Created") as! String,
                                                    nameUser: test.get("NameAuther") as! String,
                                                    idUser: test.get("ID") as! String,
                                                    category: test.get("Category") as! String)
                        DispatchQueue.global(qos: .userInteractive).async {
                            DispatchQueue.main.async {
                                addPostCoreDate(ContentPost: GetPost,context:self.context)

                            }
                        }

                    }
                    self.performSegue(withIdentifier: "moveHome", sender: self)

                }
            }
        }else{
            self.performSegue(withIdentifier: "moveAuth", sender: self)

        }

    }
    
    





}




//FirStore.collection("Contents").document(IDAuth!.uid).collection("Article").addSnapshotListener { SnapShotData, error in
//    if error == nil {
//        DispatchQueue.global(qos: .userInteractive).async {
//            DispatchQueue.main.async {
//                deleteAllDate(context: self.context)
//            }
//        }
//        guard let dateGet = SnapShotData else {return}
//        for test in dateGet.documents {
//
//            let GetPost =   ContentPost(title: test.get("Title") as! String,
//                                        content: test.get("Created") as! String,
//                                        created: test.get("Created") as! String,
//                                        nameUser: test.get("NameAuther") as! String,
//                                        idUser: test.get("ID") as! String,
//                                        category: test.get("Category") as! String)
//            DispatchQueue.global(qos: .userInteractive).async {
//                DispatchQueue.main.async {
//                    self.addPostCoreDate(ContentPost: GetPost)
//
//                }
//            }
//        }
//    }
//}
