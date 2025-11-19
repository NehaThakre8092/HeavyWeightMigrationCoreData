//
//  ProductMigration.swift
//  HeavyWeightMigCoreData
//
//  Created by Orangebits iOS User on 18/11/25.
//

import Foundation
import CoreData

class ProductMigration : NSEntityMigrationPolicy {
     
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        
        if (sInstance.entity.name == "User") {
            
            let name = sInstance.value(forKey: "name") as? String
            let age = sInstance.value(forKey: "age") as? String
            
            let newProduct = NSEntityDescription.insertNewObject(forEntityName: "User", into: manager.destinationContext)
            
            newProduct.setValue(name, forKey: "name")
            newProduct.setValue(age?.toInt(), forKey: "age")
            
            
        }
    }
}
