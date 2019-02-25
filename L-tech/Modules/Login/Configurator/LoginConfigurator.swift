//
//  LoginLoginConfigurator.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit

class LoginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LoginViewController) {

        let router = LoginRouter(viewController: viewController)

        let presenter = LoginPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LoginInteractor()
        interactor.output = presenter
        interactor.loginDataProvider = LoginDataProviderDefault()
        interactor.keyChainService = KeychainService()

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
