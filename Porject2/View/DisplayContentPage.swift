//
//  DisplayContentPage.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/11/21.
//

import UIKit

class DisplayContentPage: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var categoryContent: UILabel!
    @IBOutlet weak var createdAndName: UILabel!
    @IBOutlet weak var content: UITextView!
    
    var contentInfo:Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contentInfo?.idPost)
        contentTitle.text = contentInfo?.title
        categoryContent.text = contentInfo?.category
        createdAndName.text = "Created at: \(contentInfo!.created!), by: \( contentInfo!.nameUser!)"
        
        let data = Data((contentInfo?.content?.utf8)!)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            content.attributedText = attributedString
        }
    }
    
  

 
    @IBAction func RemoveIt(_ sender: Any) {
   
        context.delete(contentInfo!)
        fireStoreURL.collection("Contents").document((contentInfo?.idUser)! ).collection("Article").document((contentInfo?.idPost)!).delete()
            dismiss(animated: true, completion: nil)
      
        
    }
    

}
