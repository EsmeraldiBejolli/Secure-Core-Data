//
//  Person+CoreDataProperties.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 03/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var lastName: String?
    @NSManaged public var address: String?

}
