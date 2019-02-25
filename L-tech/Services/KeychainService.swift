//
//  KeychainService.swift
//  L-tech
//
//  Created by Admin on 23/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class KeychainService {
    enum Keys: String {
        case phoneNumber = "phoneNumber"
        case password = "password"
    }    
    func save(value: String, key: String) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key)
    }
    func get(key: String) -> String? {
        return KeychainWrapper.standard.string(forKey: key)
    }
}
