//
//  User+CoreDataProperties.swift
//  HeavyWeightMigCoreData
//
//  Created by Orangebits iOS User on 18/11/25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}

extension User : Identifiable {

}
