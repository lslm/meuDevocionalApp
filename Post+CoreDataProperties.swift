//
//  Post+CoreDataProperties.swift
//  MeuDevocional
//
//  Created by Beatriz Duque on 22/07/21.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var nota: String?
    @NSManaged public var backgroundImage: String?
    @NSManaged public var data: String?
    @NSManaged public var color: String?



}

extension Post : Identifiable {

}
