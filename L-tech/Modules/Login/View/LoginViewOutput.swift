//
//  LoginLoginViewOutput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

protocol LoginViewOutput {
    func sighIn(phoneNumber: String, password: String)
    func viewIsReady()
}
