//
//  Errors.swift
//  L-tech
//
//  Created by Admin on 25/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct FailedLoginOrPassword : Error {
    var description: String {
        return "Wrong login or password"
    }
}

extension FailedLoginOrPassword: LocalizedError {
    public var errorDescription: String? {
        return NSLocalizedString(description, comment: "")
    }
}
