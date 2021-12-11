//
//  ModelArticle.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/10/21.
//

import Foundation



struct ContentArticle {
    var title:String?
    var content:NSAttributedString?
    var category:String?
    init(title:String,content:NSAttributedString,category:String){
        self.title = title
        self.content = content
        self.category = category
    }
}


class ContentPost {
    var title:String?
    var idPost:String?
    var content:String?
    var created:String?
    var nameUser:String?
    var idUser:String?
    var category:String?
    init(idPost:String,title:String,content:String,created:String,nameUser:String,idUser:String,category:String){
        self.title = title
        self.idPost = idPost
        self.content = content
        self.created = created
        self.nameUser = nameUser
        self.idUser = idUser
        self.category = category
    }
    
}
