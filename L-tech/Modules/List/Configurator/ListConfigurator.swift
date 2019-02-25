//
//  ListListConfigurator.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit

class ListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListViewController) {

        let router = ListRouter(viewController: viewController)

        let presenter = ListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListInteractor()
        interactor.output = presenter
        interactor.listDataProvider = ListDataProviderDefault()
        interactor.listDataProvider.delegate = interactor

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
