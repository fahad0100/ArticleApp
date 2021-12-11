//
//  extension .swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/9/21.
//

import Foundation
import UIKit
import Firebase



//Use this function to move to any view from anywhere by performSegue
func moveAnyView(withIdentifier:String){
    UIApplication.shared.connectedScenes.first.flatMap({ $0 as? UIWindowScene })?.windows.first?.rootViewController?.performSegue(withIdentifier: withIdentifier, sender: (Any).self)
}

//Use this function to show present from anywhere 
func usePresent(UIViewController:UIViewController){
    UIApplication.shared.connectedScenes.first.flatMap({ $0 as? UIWindowScene })?.windows.first?.rootViewController?.present( UIViewController, animated: true, completion: nil)
}

