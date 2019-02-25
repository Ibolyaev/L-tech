//
//  DetailDetailPresenter.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

class DetailPresenter: DetailModuleInput, DetailViewOutput, DetailInteractorOutput {
    var selectedElement: ElementViewModel!
    weak var view: DetailViewInput!
    var interactor: DetailInteractorInput!
    var router: DetailRouterInput!

    func viewIsReady() {
        view.setDetailLabelText(with: selectedElement.text)
        view.setElementImageView(with: selectedElement.image)
        view.setTitle(with: selectedElement.title)
        view.setTitlelabel(with: selectedElement.title)
    }
}
