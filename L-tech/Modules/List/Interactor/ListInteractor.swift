//
//  ListListInteractor.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import Foundation

class ListInteractor: ListInteractorInput {
    var listDataProvider: ListDataProvider!
    weak var output: ListInteractorOutput!
    
    func getList(sort: ListSort, completionHandler: @escaping ([ElementViewModel]) -> Void) {
        listDataProvider.sort = sort
        listDataProvider.getList {[weak self] (result) in
            completionHandler(result.compactMap({ (element) -> ElementViewModel? in
                self?.getViewModelFrom(element: element)
            }))
        }
    }
    func getViewModelFrom(element: Element) -> ElementViewModel {
        let baseURL = URL(string: Api.url)!
        let imageURL = baseURL.appendingPathComponent(element.image)
        
        var dateFormatted: String?
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = "dd.MM.yyyy', 'HH:mm"
        dateFormatted = dateFormatterOutput.string(from: element.date)
        
        return ElementViewModel(id: element.id, title: element.title, text: element.text, image: imageURL, sort: element.sort, date: dateFormatted ?? "")
    } 
}

extension ListInteractor: ListDataProviderDelegate {
    func newList(list: [Element]) {
        let newList = list.compactMap({ (element) -> ElementViewModel? in
            getViewModelFrom(element: element)
        })
        output.gotNewList(list: newList)
    }
}
