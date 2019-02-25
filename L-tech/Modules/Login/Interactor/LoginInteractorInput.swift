//
//  LoginLoginInteractorInput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    var loginDataProvider: LoginDataProvider! {
        get
    }
    func getPhoneMask(completionHandler: @escaping (PhoneMaskViewModel) -> Void)
    func login(phoneNumber: String, password: String)
    func getSavedPhoneNumber()
    func getSavedPassword()
    func savePhoneNumber(_ phoneNumber: String)
    func savePassword(_ password: String)
}
