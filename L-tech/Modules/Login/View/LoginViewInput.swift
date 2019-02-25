//
//  LoginLoginViewInput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

protocol LoginViewInput: class {
    func showAlertView(with text: String, title: String)
    func setupInitialState()
    func gotPhoneMask(phoneMask: PhoneMaskViewModel)
    func setPassword(_ password: String)
    func setPhoneNumber(_ phoneNumber: String)
}
