//
//  Alert Controller.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/8/21.
//

import Foundation
import UIKit



func Alert(Title:String,Message:String,ButtonTitle:String)->UIAlertController{
    let alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: ButtonTitle, style: .default, handler: nil))
    return alert
}




//        UIApplication.shared.connectedScenes.first.flatMap({ $0 as? UIWindowScene })?.windows.first?.rootViewController?.present("view", animated: "animated", completion: "nil")


