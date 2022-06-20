//
//  CoreDataStack.swift
//  MeuDevocional
//
//
//

import CoreData

class CoreDataStack{
    
    static let shared: CoreDataStack = CoreDataStack()

    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    
    
    var context: NSManagedObjectContext{
        persistentContainer.viewContext
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
    
    func createDevocional(titulo: String, baseBiblica: String, contextualizacao: String, reflexao: String, conclusao: String, aplicacao1: String, aplicacao2: String, aplicacao3: String, backgroundColor: String, backgroundImage: String, link: String,livro: String,capitulo: String,versiculo: String,data: String) -> Devocionais{
        guard let devocionais = NSEntityDescription.insertNewObject(forEntityName: "Devocionais", into: context) as? Devocionais else {preconditionFailure()}
        devocionais.titulo = titulo
        devocionais.baseBiblica = baseBiblica
        devocionais.contextualizacao = contextualizacao
        devocionais.reflexao = reflexao
        devocionais.conclusao = conclusao
        devocionais.aplicacao1 = aplicacao1
        devocionais.aplicacao2 = aplicacao2
        devocionais.aplicacao3 = aplicacao3
        devocionais.backgroundColor = backgroundColor
        devocionais.backgroundImage = backgroundImage
        devocionais.link = link
        devocionais.livro = livro
        devocionais.capitulo = capitulo
        devocionais.versiculo = versiculo
        devocionais.data = data

        self.saveContext()
        return devocionais
    }
    
    func getDevocional() -> [Devocionais] {
        let fr = NSFetchRequest<Devocionais>(entityName: "Devocionais")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        }catch {
            print(error)
        }
        return []
    }
    func deleteDevocional(devocionais: Devocionais) throws{
        self.persistentContainer.viewContext.delete(devocionais)
        self.saveContext()
    }
}




