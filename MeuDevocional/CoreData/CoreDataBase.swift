//
//  CoreDataStack.swift
//  MeuDevocional
//
//

import CoreData

class CoreDataStackBase{
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
    
    static func createBase(anotacao: String, aplicacao1: String, aplicacao2: String, aplicacao3: String) throws -> DevocionaisBase{
        guard let base = NSEntityDescription.insertNewObject(forEntityName: "DevocionaisBase", into: context) as? DevocionaisBase else {preconditionFailure()}
        base.anotacao =  anotacao
        base.aplicacaoBase1 = aplicacao1
        base.aplicacaoBase2 = aplicacao2
        base.aplicacaoBase3 = aplicacao3
        try saveContext()
        return base
    }
    
    static func getBase() throws -> [DevocionaisBase] {
        return try context.fetch(DevocionaisBase.fetchRequest())
    }
    
    static func deleteBase(base: DevocionaisBase) throws{
        context.delete(base)
        try saveContext()
    }
}




