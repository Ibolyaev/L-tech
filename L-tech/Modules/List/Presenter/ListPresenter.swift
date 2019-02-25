//
//  ListListPresenter.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import UIKit
class ListPresenter: ListModuleInput, ListViewOutput, ListInteractorOutput {
    
    var list: [ElementViewModel] = [] {
        didSet {
            view?.updateList()
        }
    }
    var listSort: ListSort = .serverDefault
    weak var view: ListViewInput!
    var interactor: ListInteractorInput!
    var router: ListRouterInput!
    
    func selectElement(index: Int) {
        let element = list[index]
        router.showDetail(selectedElement: element)
    }
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
    func gotNewList(list: [ElementViewModel]) {
        self.list = list
    }
    func setListSort(_ sort: Int) {
        guard let newListSort = ListSort(rawValue: sort) else {
            assertionFailure("Unkown list sort")
            return
        }
        if newListSort != listSort {
            self.listSort = newListSort
            getList()
        }
    }
    func getList() {
        interactor.getList(sort: listSort) {[weak self] (result) in
            self?.list = result
        }
    }
    func listUpdateButtonTapped() {
        getList()
    }
    func viewIsReady() {
        getList()
    }
}
