//
//  Coredate.swift
//  Porject2
//
//  Created by Fahad Alazmi on 12/11/21.
//

import Foundation
import CoreData



func RelodTasks(context:NSManagedObjectContext)->[Post]{
    var arrPost:[Post] = []
    do {
        let allContent = try context.fetch(Post.fetchRequest())
        
        allContent.forEach { content in
            if content.idUser != nil {
                arrPost.append(content)
            }
        }
        arrPost.sort(by: {$0.created ?? "" < $1.created ?? ""})
        return arrPost
    }catch{
        print("Sorry, i can't add Relod Tasks")
    }
    return arrPost
}


func deleteAllDate(context:NSManagedObjectContext) {
    let context = context
    
    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
    do {
        try context.execute(deleteRequest)
        try context.save()
    } catch {
        print ("There is an error in deleting records")
    }
}



func addPostCoreDate(ContentPost:ContentPost,context:NSManagedObjectContext){
    let context = context
    let post = Post(context:context)
    post.idPost = ContentPost.idPost
    post.title = ContentPost.title
    post.content = ContentPost.content
    post.created = ContentPost.created
    post.nameUser = ContentPost.nameUser
    post.idUser = ContentPost.idUser
    post.category = ContentPost.category
    print("1")
    do {
        try context.save()
    }catch{
        print(error)
    }
    
    
}
