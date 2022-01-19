//
//  CoreDataStack.swift
//  MeuDevocional
//
//
//

import CoreData

class CoreDataStack{
    
    public static var shared: CoreDataStack = CoreDataStack()

    
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
    
    static func createDevocional(titulo: String, baseBiblica: String, contextualizacao: String, reflexao: String, conclusao: String, aplicacao1: String, aplicacao2: String, aplicacao3: String, backgroundColor: String, backgroundImage: String, link: String,livro: String,capitulo: String,versiculo: String,data: String) throws -> Devocionais{
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

        try saveContext()
        return devocionais
    }
    
    static func getDevocional() throws -> [Devocionais] {
        return try context.fetch(Devocionais.fetchRequest())
    }
    static func deleteDevocional(devocionais: Devocionais) throws{
        context.delete(devocionais)
        try saveContext()
    }
}




