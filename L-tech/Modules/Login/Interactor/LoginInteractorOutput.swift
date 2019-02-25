//
//  LoginLoginInteractorOutput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: class {
    func gotPassword(_ password: String)
    func gotPhoneNumber(_ phoneNumber: String)
    func didSignIn(success: Bool, error: Error?)
}
