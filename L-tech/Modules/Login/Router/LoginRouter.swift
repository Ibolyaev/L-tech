//
//  LoginLoginRouter.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import UIKit

class LoginRouter: LoginRouterInput {
    
    weak var viewController: LoginViewController!
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    func showList() {
        viewController.performSegue(withIdentifier: viewController.selfToListSegue, sender: nil)
    }    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}
