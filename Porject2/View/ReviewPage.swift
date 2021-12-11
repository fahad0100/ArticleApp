//
//  ReviewPage.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/10/21.
//

import UIKit

class ReviewPage: UIViewController {
    
    var contentReview:ContentArticle?
 
    
    @IBOutlet weak var TitleContent: UILabel!
    @IBOutlet weak var ContentReview: UITextView!
    @IBOutlet weak var CategoryContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleContent.text = contentReview?.title
        ContentReview.attributedText = contentReview?.content
        CategoryContent.text = contentReview?.category
        let test = UISwipeGestureRecognizer(target: self, action: #selector(panGesture))
        test.direction = .down
        test.numberOfTouchesRequired = 1
        ContentReview.addGestureRecognizer(test)
        ContentReview.isUserInteractionEnabled = true
        
    }
    @objc func panGesture(_ sender: UISwipeGestureRecognizer){
        if sender.view != nil {
            print("here i am")
            dismiss(animated: true, completion: nil)
        }
    }
  

 

}



