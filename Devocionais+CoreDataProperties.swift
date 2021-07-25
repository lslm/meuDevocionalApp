//
//  Devocionais+CoreDataProperties.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 21/07/21.
//
//

import Foundation
import CoreData


extension Devocionais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Devocionais> {
        return NSFetchRequest<Devocionais>(entityName: "Devocionais")
    }

    @NSManaged public var baseBiblica: String?
    @NSManaged public var contextualizacao: String?
    @NSManaged public var reflexao: String?
    @NSManaged public var conclusao: String?
    @NSManaged public var aplicacao1: String?
    @NSManaged public var aplicacao2: String?
    @NSManaged public var aplicacao3: String?
    @NSManaged public var backgroundColor: String?
    @NSManaged public var backgroundImage: String?
    @NSManaged public var titulo: String?
    @NSManaged public var link: String?
    @NSManaged public var capitulo: String?
    @NSManaged public var versiculo: String?
    @NSManaged public var livro: String?


}

extension Devocionais : Identifiable {

}
