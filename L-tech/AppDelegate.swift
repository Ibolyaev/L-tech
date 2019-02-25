//
//  AppDelegate.swift
//  L-tech
//
//  Created by Admin on 21/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let listDataProvider = ListDataProviderDefault()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.setMinimumBackgroundFetchInterval(
            UIApplication.backgroundFetchIntervalMinimum)
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        listDataProvider.getListFromServer { (result) in
            if result.count == 0 {
                completionHandler(.noData)
            } else {
                completionHandler(.newData)
            }
        }
    }
}

