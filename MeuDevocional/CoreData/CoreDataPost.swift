//
//  CoreDataStack.swift
//  MeuDevocional
//
//

import CoreData

class CoreDataStackPost{
    static let shared: CoreDataStackPost = CoreDataStackPost()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    
    var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Problema de contexto: \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createPost(nota: String, backgroundImage: String, data: String, color: String) -> Post{
        guard let post = NSEntityDescription.insertNewObject(forEntityName: "Post", into: context) as? Post else {preconditionFailure()}
        post.nota = nota
        post.backgroundImage = backgroundImage
        post.data = data
        post.color = color 
        
        self.saveContext()
        return post
    }
    
    func getPost() -> [Post] {
        let fr = NSFetchRequest<Post>(entityName: "Post")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        }catch {
            print(error)
        }
        return []
    }
    
    func deletePost(post: Post) throws{
        self.persistentContainer.viewContext.delete(post)
        self.deleteWidget()
        self.saveContext()
    }
    
    ///funcao auxiliar para deletar o motivo selecionado do userDefaults tambem
    func deleteWidget(){
        UserDefaultsManager.shared.background = [""]
        UserDefaultsManager.shared.gratidao = [""]
        do {
            let post = try context.fetch(Post.fetchRequest())
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
        }catch{
            print("Nao foi possivel excluir widget")
        }
        //print("gratidao2",UserDefaultsManager.shared.gratidao)
    }
    
}



