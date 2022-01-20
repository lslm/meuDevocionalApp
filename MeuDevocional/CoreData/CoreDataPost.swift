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
        
        try saveContext()
        return post
    }
    
    static func getPost() throws -> [Post] {
        return try context.fetch(Post.fetchRequest())
    }
    
    static func deletePost(post: Post) throws{
        context.delete(post)
        deleteWidget()
        try saveContext()
    }
    
    ///funcao auxiliar para deletar o motivo selecionado do userDefaults tambem
    static func deleteWidget(){
        UserDefaultsManager.shared.background = [""]
        UserDefaultsManager.shared.gratidao = [""]
        let post = try! context.fetch(Post.fetchRequest())
            ///reseta o vetor do user defaults
            var vetaux: [String] = [""]
            var vetaux2: [String] = [""]
            for i in 0..<post.count{
                vetaux.append(post[i].nota ?? "Pelo o que você é grato hoje?")
                vetaux2.append(post[i].backgroundImage ?? "postit1")
            }
            ///atualiza o vetor do user defaults
             UserDefaultsManager.shared.gratidao = vetaux
             UserDefaultsManager.shared.background = vetaux2
        print("gratidao2",UserDefaultsManager.shared.gratidao)
    }
    
}



