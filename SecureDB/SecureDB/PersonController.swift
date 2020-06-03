//
//  PersonController.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 03/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import Foundation
import CoreData
class PersonController {
    func getPerson() {
        
    }
    
    class func setPerson(viewContext: NSManagedObjectContext) {
        let personCryptoSettings = CryptoUtils.getCryptoTableSettings(tableName: "crypto-person")
        let person = Person(context: viewContext)
        let keys = Array(Person.entity().attributesByName.keys)

        for key in keys {
            if personCryptoSettings.contains(key) {
                person.setValue("encrypted \(Int.random(in: 1..<100))", forKey: key)
            } else {
                switch key {
                case  Properties.id.rawValue:
                    person.setValue(Int64(123), forKey: key)
                    break
                case Properties.address.rawValue:
                    person.setValue("bergen", forKey: key)
                    break
                default:
                    person.setValue("value", forKey: key)
                }
            }
        }
    }
    
    class func getPeople() -> [PersonModel]? {
        do {
            let persons = try AppDelegate.shared.persistentContainer.viewContext.fetch(Person.fetchRequest())
            
            return persons.map { person in
                personMapToModel(person: person as! Person)
            }

         } catch {
             fatalError("Failed to fetch employees: \(error)")
         }
    }
    
    func deletePersons() {
        
    }
    
    enum Properties: String {
          case name, lastName, address, id
    }
}

func personMapToModel(person: Person) -> PersonModel {
    let personCryptoSettings = CryptoUtils.getCryptoTableSettings(tableName: "crypto-person")
    let keys = Array(Person.entity().attributesByName.keys)
    var personModel = PersonModel()
        for key in keys {
            if personCryptoSettings.contains(key) {
                personModel[key] = "descrypted \(key) \(Int.random(in: 1..<100))"
            } else {
                personModel[key] = person.value(forKey: key) as? String ?? ""
        }
      
    }
    
    return personModel
}

