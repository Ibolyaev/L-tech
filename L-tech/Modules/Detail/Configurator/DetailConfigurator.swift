//
//  DetailDetailConfigurator.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit

class DetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailViewController) {

        let router = DetailRouter()

        let presenter = DetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
