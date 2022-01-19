//
//  CoreDataStack.swift
//  MeuDevocional
//
//

import CoreData

class CoreDataStackPost{
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static func saveContext() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createPost(nota: String, backgroundImage: String, data: String, color: String) throws -> Post{
        guard let post = NSEntityDescription.insertNewObject(forEntityName: "Post", into: context) as? Post else {preconditionFailure()}
        post.nota = nota
        post.backgroundImage = backgroundImage
        post.data = data
        post.color = color 
        
        
        UserDefaultsManager.shared.gratidao = nota
        UserDefaultsManager.shared.background = backgroundImage
        
        try saveContext()
        return post
    }
    
    static func getPost() throws -> [Post] {
        return try context.fetch(Post.fetchRequest())
    }
    
    static func deletePost(post: Post) throws{
        context.delete(post)
        try saveContext()
    }
}



