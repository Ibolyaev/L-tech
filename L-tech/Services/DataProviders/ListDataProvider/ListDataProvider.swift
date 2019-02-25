//
//  ListDataProvider.swift
//  L-tech
//
//  Created by Admin on 23/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol ListDataProvider {
    var delegate: ListDataProviderDelegate? {
        get set
    }
    var sort: ListSort {
        get set
    }
    func getList(completionHandler: @escaping ([Element]) -> Void)
}
