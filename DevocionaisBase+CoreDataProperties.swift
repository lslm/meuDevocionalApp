//
//  DevocionaisBase+CoreDataProperties.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 23/07/21.
//
//

import Foundation
import CoreData


extension DevocionaisBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DevocionaisBase> {
        return NSFetchRequest<DevocionaisBase>(entityName: "DevocionaisBase")
    }

    @NSManaged public var anotacao: String?
    @NSManaged public var aplicacaoBase1: String?
    @NSManaged public var aplicacaoBase2: String?
    @NSManaged public var aplicacaoBase3: String?

}

extension DevocionaisBase : Identifiable {

}
