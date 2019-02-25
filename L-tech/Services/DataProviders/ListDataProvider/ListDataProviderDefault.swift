//
//  ListDataProviderDefault.swift
//  L-tech
//
//  Created by Admin on 23/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import RealmSwift

class ListDataProviderDefault: ListDataProvider {
    let requestFactory = RequestFactory()
    var results: Results<Element>
    var sort: ListSort = .serverDefault {
        didSet {
            switch sort {
            case .serverDefault:
                results = realm.objects(Element.self)
            case .byDate:
                results = results.sorted(byKeyPath: "date", ascending: true)
            }
        }
    }
    private var notificationToken: NotificationToken?
    weak var delegate: ListDataProviderDelegate? {
        didSet {
            notificationToken = results.observe {[weak self] _ in
                guard let delegate = self?.delegate,
                let results = self?.results else {
                    return
                }
                delegate.newList(list: Array(results))
            }
        }
    }
    
    let realm: Realm
    init() {
        realm = try! Realm()
        results = realm.objects(Element.self)
    }
    func getList(completionHandler: @escaping ([Element]) -> Void) {
        // Return objects from database
        completionHandler(Array(results))
        // Start to download any new data from server
        getListFromServer( completionHandler: { (result) in
            //
        })
    }
    func getListFromServer(completionHandler: @escaping ([Element]) -> Void) {
        let listRequest = requestFactory.makeListRequestFactory()
        listRequest.getList { [weak self] (result) in
            guard let list = result.value else {
                return
            }
            try! self?.realm.write {
                self?.realm.add(list, update: true)
            }
            completionHandler(list)
        }
    }
}
