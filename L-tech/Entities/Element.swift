//
//  ListResult.swift
//  L-tech
//
//  Created by Admin on 23/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

typealias ListResult = [Element]

class Element: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String
    @objc dynamic var text: String
    @objc dynamic var image: String
    @objc dynamic var sort: Int
    @objc dynamic var date: Date
    override static func primaryKey() -> String? {
        return "id"
    }
}
