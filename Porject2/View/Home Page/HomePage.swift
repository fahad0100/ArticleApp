//
//  Home.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/8/21.
//

import UIKit
import Firebase
class HomePage: UIViewController {
    
    
    @IBOutlet weak var CollectionContent: UICollectionView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var arrContent:[Post] = []
    var sendContentInfo:Post?
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 0, right: 50)
        layout.itemSize = CGSize(width: screenWidth/2.5, height: screenWidth/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        CollectionContent!.collectionViewLayout = layout
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.async {
                self.CollectionContent.reloadData()
            }
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.async {
                self.arrContent = RelodTasks(context: self.context)
                if self.arrContent.count == 0 {
                    self.imageView.frame = CGRect(x:0, y:  self.screenSize.midX, width: self.screenWidth, height: self.screenWidth)
                    self.imageView.image = UIImage(named: "file")
                    self.view.addSubview(self.imageView)
                }
                self.CollectionContent.reloadData()
            }
        }
    }
    
    
    
    
    //    @IBAction func SignOutAction(_ sender: Any) {
    //
    //        do {
    //
    //             try Auth.auth().signOut()
    //            dismiss(animated: true, completion: nil)
    //         }catch {
    //             print(error.localizedDescription)
    //         }
    //    }
}



extension HomePage:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionContent.dequeueReusableCell(withReuseIdentifier: "cellcontent", for: indexPath) as! HomeCell
        //        cell.frame.size.width = screenWidth / 3
        cell.titleLabel.text = arrContent[indexPath.row].title
        cell.categoryLabel.text = arrContent[indexPath.row].category
        cell.createLabel.text = "Created at:\n \(arrContent[indexPath.row].created!)"
        
        
        
        
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sendContentInfo = arrContent[indexPath.row]
        performSegue(withIdentifier: "displayContent", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayContent"{
            let vc = segue.destination as! DisplayContentPage
            vc.contentInfo =  sendContentInfo
        }
    }
    
    
}
