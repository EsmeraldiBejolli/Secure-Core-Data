//
//  Person.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 02/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import Foundation

struct PersonModel: Codable {
    var name: String?
    var lastName: String?
    var addres: String?
    var id: Int?
    
    
    private func value(forKey: String) -> String {
        switch forKey {
        case Keys.name.rawValue:
            return name ?? ""
            break
        case Keys.lastName.rawValue:
            return lastName ?? ""
            break
        case Keys.id.rawValue:
            return "\(id)"
            break
        case Keys.address.rawValue:
            return addres ?? ""
            break
        default:
           fatalError("key not found")
        }
    }
    
    private mutating func setValue(value: String, key: String) {
        switch key {
            case Keys.name.rawValue:
                self.name = value
                break
            case Keys.lastName.rawValue:
                self.lastName = value
                break
            case Keys.id.rawValue:
                self.id = Int(value)
                break
            case Keys.address.rawValue:
                addres = value
                break
            default:
               fatalError("key not found")
            }
    }
    
    subscript(key: String) -> String {
        get {
            value(forKey: key)
        }
        set(newValue) {
            setValue(value: newValue, key: key)
        }
    }
    
    private enum Keys: String {
          case name, lastName, address, id
    }
}

