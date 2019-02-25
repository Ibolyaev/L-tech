//
//  ListListInteractorInput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    var listDataProvider: ListDataProvider! {
        get
    }
    func getList(sort: ListSort, completionHandler: @escaping ([ElementViewModel]) -> Void)
}
