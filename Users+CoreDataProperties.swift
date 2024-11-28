//
//  Users+CoreDataProperties.swift
//  Birthday
//
//  Created by Olekssandr on 06/11/2024.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var age: Date?
    @NSManaged public var email: String?

}

extension Users : Identifiable {

}
