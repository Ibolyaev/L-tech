//
//  PhoneMask.swift
//  L-tech
//
//  Created by Admin on 23/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
struct PhoneMask: Codable {
    let mask: String
    enum CodingKeys: String, CodingKey {
        case mask = "phoneMask"
    }
}
