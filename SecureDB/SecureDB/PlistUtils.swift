//
//  PlistUtils.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 03/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import Foundation
class PlistUtils {
    class func getData(resourceName: String) -> Dictionary<String, Any>? {
          guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist") else {
              print("cant find file")
            return nil
          }
        
        return PlistUtils.getFileContent(filePath: filePath)
    }
  
    
    class func getFileContent(filePath: String?) -> Dictionary<String, Any> {
        return NSDictionary(contentsOfFile: filePath!) as! Dictionary<String, Any>
    }
    
    class func getCryptoSettings() -> Dictionary<String, Any>? {
       let data = getData(resourceName: "config")
        
        return data?.filter {$0.0.contains("crypto")} ?? nil
    }
}
