//
//  LoginDataProvider.swift
//  L-tech
//
//  Created by Admin on 21/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol LoginDataProvider: class {
    func getPhoneMask(completionHandler: @escaping (PhoneMask) -> Void)
    func auth(phoneNumber: String, password: String, completionHandler: @escaping (LoginResult) -> Void)
}
