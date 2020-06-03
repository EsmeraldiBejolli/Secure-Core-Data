//
//  CryptoUtils.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 03/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import Foundation

class CryptoUtils {
    class func getCryptoTableSettings(tableName: String) -> [String] {
        guard let cryptoSettings = PlistUtils.getCryptoSettings()  else {
            return []
        }
        
        let cryptoSettingsData: String = cryptoSettings[tableName] as! String
        
        return cryptoSettingsData.components(separatedBy: ",")
    }
}
