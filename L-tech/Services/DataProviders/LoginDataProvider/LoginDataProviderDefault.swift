//
//  LoginDataProviderDefault.swift
//  L-tech
//
//  Created by Admin on 21/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class LoginDataProviderDefault: LoginDataProvider {
    
    let requestFactory = RequestFactory()
    func getPhoneMask(completionHandler: @escaping (PhoneMask) -> Void) {
        let phoneMaskRequest = requestFactory.makePhoneMaskRequestFactory()
        phoneMaskRequest.getMask {(response) in
            guard let mask = response.value else {
                return
            }
            completionHandler(mask)
        }
    }
    
    func auth(phoneNumber: String, password: String, completionHandler: @escaping (LoginResult) -> Void) {
        let loginRequest = requestFactory.makeAuthRequestFactory()
        loginRequest.login(userName: phoneNumber, password: password) {(result) in
            guard let loginResult = result.value else {
                return
            }
            completionHandler(loginResult)
        }
    }
}
