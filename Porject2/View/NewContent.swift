//
//  NewContent.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/9/21.
//

import UIKit
import Firebase
class NewContent: UIViewController {


    @IBOutlet weak var TitleContent: UITextField!
    @IBOutlet weak var Content: UITextView!
    @IBOutlet weak var CategoryContent: UIPickerView!
    var ContentReview:NSAttributedString?
    
    let pickerDataTitle = ["Technique", "Programming", "Networks", "Cyber security", "Computer Engineering", "Data science"]
    var SelectedCategory:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectedCategory = pickerDataTitle[0]
        self.CategoryContent.delegate = self
        self.CategoryContent.dataSource = self
        CategoryContent.layer.backgroundColor = UIColor.white.cgColor
        CategoryContent.backgroundColor = .white
        Content.layer.cornerRadius = 10
        Content.layer.borderWidth = 0.5
        Content.layer.borderColor = UIColor.gray.cgColor
        
    }


    
    @IBAction func ReviewAction(_ sender: Any) {

        let data = Data(Content.text.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            ContentReview = attributedString
            performSegue(withIdentifier: "moveToReview", sender: self)
        }
      
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToReview" {
            let vc = segue.destination as! ReviewPage
            vc.modalPresentationStyle = .fullScreen
            vc.contentReview = ContentArticle(title: TitleContent.text!, content: ContentReview!, category: SelectedCategory!)
            present(vc, animated: true, completion: nil)
        }
    }

    
    @IBAction func SaveAction(_ sender: Any) {
        let id = Auth.auth().currentUser?.uid
        let nameAuther = Auth.auth().currentUser?.displayName
        
        guard TitleContent.text != "" else {return present(Alert(Title: "تنبية", Message: "write your title", ButtonTitle: "ok"), animated: true, completion: nil)}
        guard Content.text != "" else {return present(Alert(Title: "تنبية", Message: "write your content", ButtonTitle: "ok"), animated: true, completion: nil)}
        guard SelectedCategory != nil else {return present(Alert(Title: "تنبية", Message: "write your Category", ButtonTitle: "ok"), animated: true, completion: nil)}
        guard id != nil else{return present(Alert(Title: "تنبية", Message: "You shloud sign in", ButtonTitle: "ok"), animated: true, completion: nil)}
        guard nameAuther != nil else{return present(Alert(Title: "تنبية", Message: "Please create your name", ButtonTitle: "ok"), animated: true, completion: nil)}
        let ContentPost = ["Title":TitleContent.text!,"Content":Content.text!,"Category":SelectedCategory!,"Created":dateCreated()!,"ID":id!,"NameAuther":nameAuther,] as [String:Any]
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.async {
                fireStoreURL.collection("Contents").document(id!).collection("Article").document().setData(ContentPost)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
  
    func dateCreated()->String?{
        let dateNow = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm a"
        let createDate = formatter.string(from: dateNow)
        return createDate
    }
}

extension NewContent: UIPickerViewDelegate,UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataTitle.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return pickerDataTitle[row]
    }
  
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return CGFloat(100)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SelectedCategory = pickerDataTitle[row]
    }
}






