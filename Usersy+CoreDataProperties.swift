//
//  Usersy+CoreDataProperties.swift
//  Birthday
//
//  Created by Olekssandr on 15/11/2024.
//
//

import Foundation
import CoreData


extension Usersy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usersy> {
        return NSFetchRequest<Usersy>(entityName: "Usersy")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Date?
    @NSManaged public var surname: String?
    @NSManaged public var phonNumber: Int16
    @NSManaged public var id: String?

}

extension Usersy : Identifiable {

}
